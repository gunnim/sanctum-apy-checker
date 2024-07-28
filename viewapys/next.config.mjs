/** @type {import('next').NextConfig} */
import path from 'path';
import process from 'process';
const nextConfig = {
    sassOptions: {
        includePaths: [path.join(process.cwd(), 'src', 'styles')],
    },
};

export default nextConfig;
