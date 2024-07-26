# Define an array of strings for the "lst" parameter
$lstParams = @(
  "fpSoL8EJ7UA5yJxFKWk1MFiWi35w8CbH36G5B9d7DsV",
  "Fi5GayacZzUrfaCRCJtBz2vSYkGF56xjgCceZx5SbXwq",
  "pathdXw4He1Xk3eX84pDdDZnGKEme3GivBamGCVPZ5a",
  "jupSoLaHXQiZZTSfEWMTRRgpnyFm8f6sZdosWBjx93v",
  "BgYgFYq4A9a2o5S1QbWkmYVFBh7LBQL8YvugdhieFg38",
  "phaseZSfPxTDBpiVb96H4XFSD8xHeHxZre5HerehBJG",
  "BANXyWgPpa519e2MtQF1ecRbKYKKDMXPF1dyBxUq9NQG",
  "iceSdwqztAQFuH6En49HWwMxwthKMnGzLFQcMN3Bqhj",
  "fmSoLKzBY6h9b5RQ67UVs7xE3Ym6mx2ChpPxHdoaVho",
  "AxM7a5HNmRNHbND6h5ZMSsU8n3NLa1tskoN6m5mAgVvL",
  "MLLWWq9TLHK3oQznWqwPyqD7kH4LXTHSKXK4yLz7LjD",
  "pWrSoLAhue6jUxUkbWgmEy5rD9VJzkFmvfTDV5KgNuu",
  "suPer8CPwxoJPQ7zksGMwFvjBQhjAHwUMmPV4FVatBw",
  "jucy5XJ76pHVvtPZb5TKRcGQExkwit2P5s4vY8UzmpC",
  "BonK1YhkXEGLZzwtcvRTip3gAL9nCeQD7ppZBLXhtTs",
  "Dso1bDeDjCQxTrWHqUUi63oBvV7Mdm6WaobLbQ7gnPQ",
  "Comp4ssDzXcLeu2MnLuGNNFC4cmLPMng8qWHPvzAMU1h",
  "picobAEvs6w7QEknPce34wAE4gknZA9v5tTonnmHYdX",
  "GRJQtWwdJmp5LLpy8JWjPgn5FnLyqSJGNhn5ZnCTFUwM",
  "HUBsveNpjo5pWqNkH57QzxjQASdTVXcSK7bVKTSZtcSX",
  "strng7mqqc1MBJJV6vMzYbEqnwVGvKKGKedeCvtktWA",
  "LnTRntk2kTfWEY6cVB8K9649pgJbt6dJLS1Ns1GZCWg",
  "st8QujHLPsX3d6HG9uQg9kJ91jFxUgruwsb1hyYXSNd",
  "pumpkinsEq8xENVZE6QgTS93EN4r9iKvNxNALS1ooyp",
  "he1iusmfkpAdwvxLNGV8Y1iSbj4rUy6yMhEA3fotn9A",
  "LSoLi4A4Pk4i8DPFYcfHziRdEbH9otvSJcSrkMVq99c",
  "CgnTSoL3DgY9SFHxcLj6CgCgKKoTBr6tp4CPAEWy25DE",
  "LAinEtNLgpmCP9Rvsf5Hn8W6EhNiKLZQti1xfWMLy6X",
  "vSoLxydx6akxyMD9XEcPvGYNGq6Nn66oqVb3UkGkei7",
  "bSo13r4TkiE4KumL71LsHTPpL2euBYLFx6h9HP3piy1",
  "GEJpt3Wjmr628FqXxTgxMce1pLntcPV4uFi8ksxMyPQh",
  "J1toso1uCk3RLmjorhTtrVwY9HJ7X8V9yYac6Y7kGCPn",
  "7Q2afV64in6N6SeZsAAB81TJzwDoD6zpqmHkzi9Dcavn",
  "LSTxxxnJzKDFSLr4dUkPcmCf5VyryEqzPLz5j4bpxFp",
  "Zippybh3S5xYYam2nvL6hVJKz1got6ShgV4DyD1XQYF",
  "edge86g9cVz87xcpKpy3J77vbp4wYd9idEV562CCntt",
  "ThUGsoLWtoTCfb24AmQTKDVjTTUBbNrUrozupJeyPsy",
  "WensoLXxZJnev2YvihHFchn1dVVFnFLYvgomXWvvwRu",
  "camaK1kryp4KJ2jS1HDiZuxmK7S6dyEtr9DA7NsuAAB",
  "2LuXDpkn7ZWMqufwgUv7ZisggGkSE5FpeHCHBsRgLg3m",
  "D1gittVxgtszzY4fMwiTfM4Hp7uL5Tdi1S9LYaepAUUm",
  "3bfv2scCdbvumVBc3Sar5QhYXx7Ecsi8EFF2akjxe329",
  "DLGToUUnqy9hXxpJTm5VaiBKqnw9Zt1qzvrpwKwUmuuZ",
  "DUAL6T9pATmQUFPYmrWq2BkkGdRxLtERySGScYmbHMER",
  "haSo1Vz5aTsqEnz8nisfnEsipvbAAWpgzRDh2WhhMEh",
  "HausGKcq9G9zM3azwNmgZyzUvYeeqR8h8663PmZpxuDj",
  "KUMAgSzADhUmwXwNiUbNHYnMBnd89u4t9obZThJ4dqg",
  "nordEhq2BnR6weCyrdezNVk7TwC3Ej94znPZxdBnfLM",
  "PoLaRbHgtHnmeSohWQN83LkwA4xnQt91VUqL5hx5VTc",
  "EPCz5LK372vmvCkZH3HgSuGNKACJJwwxsofW6fypCPZL",
  "RSoLp7kddnNwvvvaz4b1isQy8vcqdSwXjgm1wXaMhD8",
  "spkyB5SzVaz2x3nNzSBuhpLSEF8otbRDbufc73fuLXg",
  "stkrHcjQGytQggswj3tCF77yriaJYYhrRxisRqe9AiZ",
  "B5GgNAZQDN8vPrQ15jPrXmJxVtManHLqHogj9B9i4zSs",
  "fuseYvhNJbSzdDByyTCrLcogsoNwAviB1WeewhbqgFc",
  "MangmsBgFqJhW4cLUR9LxfVgMboY1xAoP8UUBiWwwuY",
  "apySoLhdVa6QbvNyEjXCbET3FdUm9cCdEvYyjCU7icM",
  "StPsoHokZryePePFV8N7iXvfEmgUoJ87rivABX7gaW6",
  "5oVNBeEEQvYi1cX3ir8Dx5n1P7pdxydbGF2X4TxVusJm",
  "7dHbWXmci3dT8UFYWYZweBLXgycu7Y3iL6trKn1Y7ARj",
  "mSoLzYCxHdYgdzU16g5QSh3i5K3z3KZK7ytfqcJm7So"
)

# Construct the URL with the "lst" parameters
$url = "https://sanctum-extra-api.ngrok.dev/v1/apy/latest?" + ($lstParams | ForEach-Object { "lst=$_" } -join "&")

# Create a Uri object from the URL
$uri = [System.Uri]$url

# Make the request
$response = Invoke-RestMethod -Uri $uri

# Parse the response JSON
$jsonResponse = $response | ConvertFrom-Json

# Access the "apys" and "errs" properties
$apys = $jsonResponse.apys
$errs = $jsonResponse.errs

# Iterate over the "apys" and "errs" properties
foreach ($key in $apys.Keys) {
  $apy = $apys[$key]
  Write-Host "APY for $key: $apy"

  # Write data to Azure Storage Table
  $storageAccountName = "your_storage_account_name"
  $storageAccountKey = "your_storage_account_key"
  $tableName = "your_table_name"

  # Create a storage context
  $context = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKey

  # Create a table entity
  $entity = New-Object -TypeName Microsoft.Azure.Cosmos.Table.DynamicTableEntity
  $entity.PartitionKey = "APY"
  $entity.RowKey = $key
  $entity.Properties.Add("APY", $apy)

  # Insert the entity into the table
  $table = Get-AzStorageTable -Name $tableName -Context $context
  $table.CloudTable.Execute([Microsoft.Azure.Cosmos.Table.TableOperation]::InsertOrReplace($entity))
}

foreach ($key in $errs.Keys) {
  $err = $errs[$key]
  Write-Host "Error for $key: $err.code - $err.message"
}
