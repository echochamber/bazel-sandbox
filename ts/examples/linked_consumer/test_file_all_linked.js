// Asserts all dependencies are available directly from the file

const testLib = require('../linked/index')

console.log('loaded dependency', testLib.importDep().id())
console.log('loaded devDependency', testLib.importDevDep().id())