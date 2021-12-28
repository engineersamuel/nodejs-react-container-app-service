module.exports = {
  "roots": [
    "<rootDir>/src"
  ],
  "testMatch": [
    "**/__tests__/**/*.+(ts|tsx|js)",
    "**/?(*.)+(spec|test).+(ts|tsx|js)"
  ],
  "transform": {
      "^.+\\.css$": "<rootDir>/config/jest/cssTransform.js",
      "^.+\\.(ts|tsx)$": "ts-jest",
      "^(?!.*\\.(js|jsx|json|gql|graphql)$)": "<rootDir>/config/jest/fileTransform.js",
      "\\.(gql|graphql)$": "jest-transform-graphql"
  },
  "moduleNameMapper": {
    "\\.css$": "<rootDir>/config/jest/cssTransform.js"
  }
}