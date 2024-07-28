"use client"

import { TableServiceClient, TableClient, odata, AzureSASCredential, TableEntityResult } from "@azure/data-tables";
import { useEffect, useMemo, useRef, useState } from "react";

import { parse } from "@std/toml";
import LST from "./lst";

export default function Home() {

  const [curApy, setCurApy] = useState(10)
  const [targetApy, setTargetApy] = useState(20)

  const apySpreadPerDay = (targetApy - curApy) / 365
  const daysTillProfit = 0.1 / apySpreadPerDay

  const [lstsRetrieved, setLstsRetrieved] = useState(false)
  const [dataRetrieved, setDataRetrieved] = useState(false)

  const sasToken = 'sv=2022-11-02&ss=t&srt=co&sp=rl&se=2124-07-28T22:39:02Z&st=2024-07-28T14:39:02Z&spr=https&sig=U9BPkZ1%2B57bmbhO0xsntX4DSKn5dJdOHoxPdIAKS2E0%3D'

  const account = "ggsanctumapychecker";
  const tableName = "sanctumApys";
  const sasCredential = new AzureSASCredential(sasToken);

  let lstInfo = useRef<Record<string, LST>>({})
  const apyRecordsWithAvg = useRef<Record<string, { avg: number, records: number[] }>>({})
  const sortedRecordKeys = useRef<string[]>([])

  useEffect(() => {
    async function fetchLSTData() {
      const resp = await fetch('https://raw.githubusercontent.com/igneous-labs/sanctum-lst-list/master/sanctum-lst-list.toml')
      const data = await resp.text()

      const tomlObject = parse(data) as Record<string, LST[]>;

      tomlObject.sanctum_lst_list.reduce((obj, lst) => {
        obj[lst.mint] = lst
        return obj
      }, lstInfo.current)
    }

    async function fetchAPYData() {
      const respData = Array<TableEntityResult<Record<string, string>>>()

      const tableClient = new TableClient(
        `https://${account}.table.core.windows.net`,
        tableName,
        sasCredential
      );

      // const topN = 5;
      // const partitionKey = "jupSoLaHXQiZZTSfEWMTRRgpnyFm8f6sZdosWBjx93v";

      const entities = tableClient.listEntities<Record<string, string>>({
        // queryOptions: { filter: odata`PartitionKey eq ${partitionKey}` }
      });
      // const iterator = entities.byPage({ maxPageSize: topN });

      for await (const entity of entities) {
        respData.push(entity)
      }

      // Sort by timestamp in descending order
      respData.sort((a, b) => {
        const dateA = new Date(a.timestamp!)
        const dateB = new Date(b.timestamp!)

        if (dateA > dateB) {
          return -1;
        } else if (dateA < dateB) {
          return 1;
        }

        // a must be equal to b
        return 0;
      })

      const apyRecords: Record<string, number[]> = {}

      respData.reduce((apymap, entity) => {

        if (apymap[entity.partitionKey!]) {
          apymap[entity.partitionKey!].push(+entity.APY)
        }
        else {
          apymap[entity.partitionKey!] = [+entity.APY]
        }

        return apymap
      }, apyRecords)

      for (const rec in apyRecords) {
        const sum = apyRecords[rec]
          .reduce((acc, curr) => acc + curr, 0)

        apyRecordsWithAvg.current[rec] = {
          avg: sum / apyRecords[rec].length,
          records: apyRecords[rec]
        }
      }

      // sort LSTs by avg APY in descending order
      sortedRecordKeys.current
        = Object.keys(apyRecordsWithAvg.current)
          .sort((a, b) => {

            if (apyRecordsWithAvg.current[a].avg > apyRecordsWithAvg.current[b].avg) {
              return -1;
            } else if (apyRecordsWithAvg.current[a].avg < apyRecordsWithAvg.current[b].avg) {
              return 1;
            }

            // a must be equal to b
            return 0;
          })

      setDataRetrieved(true)
    }

    fetchLSTData()
    fetchAPYData()
  }, [])


  return (
    <main className="">
      <div className="">
        {!dataRetrieved ?
          <p>Loading..</p> : (() => {

            const dateNow = new Date()

            return (
              <section>
                <h1>
                  APY Data ('-' means unchanged)
                </h1>
                <table className="table">
                  <thead>
                    <tr>
                      <th scope="col">LST Logo</th>
                      <th scope="col">LST Name</th>
                      <th scope="col">Average APY</th>
                      <th scope="col">Number of measurements</th>
                      <th scope="col">Latest APY value | {`${dateNow.getFullYear()}-${dateNow.getMonth()}-${dateNow.getDate()}`}</th>
                      <th scope="col">Latest APY value -1 | {`${dateNow.getFullYear()}-${dateNow.getMonth()}-${dateNow.getDate() - 1}`}</th>
                      <th scope="col">Latest APY value -2 | {`${dateNow.getFullYear()}-${dateNow.getMonth()}-${dateNow.getDate() - 2}`}</th>
                    </tr>
                  </thead>
                  <tbody>
                    {sortedRecordKeys.current.map((key, index) => {

                      const lst = apyRecordsWithAvg.current[key]

                      return (
                        <tr key={index}>
                          <td><img src={lstInfo.current[key].logo_uri} height={30} width={30} /></td>
                          <td>{lstInfo.current[key].name}</td>
                          <td>{(lst.avg * 100).toFixed(2)}%</td>
                          <td>{lst.records.length}</td>
                          <td>{lst.records.length && `${(lst.records[0] * 100).toFixed(2)}%`}</td>
                          <td>{lst.records.length > 1
                            ? (() => {
                              if (Math.floor(lst.records[1] * 10000) == Math.floor(lst.records[0] * 10000)) {
                                return '-'
                              }
                              else {
                                return `${(lst.records[1] * 100).toFixed(2)}%`
                              }
                            })()
                            : 'N/A'
                          }
                          </td>
                          <td>{lst.records.length > 2
                            ? (() => {
                              if (Math.floor(lst.records[2] * 10000) == Math.floor(lst.records[0] * 10000)) {
                                return '-'
                              }
                              else {
                                return `${(lst.records[2] * 100).toFixed(2)}%`
                              }
                            })()
                            : 'N/A'
                          }
                          </td>
                        </tr>
                      )
                    })}
                  </tbody>
                </table>
              </section>
            )
          })()}

        <section>
          <h1>How long until we profit from an increased APY after swapping LSTs ?</h1>
          <h4>(This isn't particularly exact nor useful but at least it's something :))</h4>
          <label htmlFor="current-apy">
            Current APY

            <input
              id="current-apy"
              name="current-apy"
              type="number"
              onChange={e => setCurApy(+e.target.value)}
              value={curApy} />
          </label>
          <label htmlFor="target-apy">
            Target APY

            <input
              id="target-apy"
              name="target-apy"
              type="number"
              onChange={e => setTargetApy(+e.target.value)}
              value={targetApy} />
          </label>

          <p>~{daysTillProfit.toFixed(2)} days untill swap is profitable</p>
        </section>

      </div>
    </main>
  );
}
