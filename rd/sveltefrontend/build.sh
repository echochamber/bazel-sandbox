thisdir=$(dirname "$1")
cd $thisdir
pwd
pnpm install
npm run build 
# vite build
# npm run dev