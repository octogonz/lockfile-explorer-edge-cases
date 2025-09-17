"use strict";

module.exports = {
  hooks: {
    readPackage,
  },
};

/**
 * This hook is invoked during installation before a package's dependencies
 * are selected.
 * The `packageJson` parameter is the deserialized package.json
 * contents for the package that is about to be installed.
 * The `context` parameter provides a log() function.
 * The return value is the updated object.
 */
function readPackage(packageJson, context) {
  // Part of the test case "link-specifier/linker", this produces a "link:" specifier
  // under the "packages" section of pnpm-lock.yaml
  if (packageJson.name === "has-symbols") {
    packageJson.dependencies["target-folder"] =
      "link:link-specifier/target-folder";
  }

  return packageJson;
}
