/** @type {import('next').NextConfig} */
const nextConfig = {
  webpack: (config) => {
    config.resolve.fallback = { fs: false };
    return config;
  },
  images: {
    domains: ['api-shop.codetify.tech','localhost'],
  }

}

module.exports = nextConfig
