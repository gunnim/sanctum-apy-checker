/** @type {import('next').NextConfig} */
import path from 'path';
import process from 'process';
const nextConfig = {
  output: 'export',

  sassOptions: {
    includePaths: [path.join(process.cwd(), 'src', 'styles')],
  },
};

export default nextConfig;
