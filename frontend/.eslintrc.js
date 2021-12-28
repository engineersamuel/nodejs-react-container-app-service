module.exports = {
  root: true,
  parser: '@typescript-eslint/parser',
  plugins: [
    '@typescript-eslint',
    'jest'
  ],
  extends: [
    'airbnb-typescript',
    'plugin:jest/recommended'
  ],
  overrides: [
    {
      files: ['*.ts', '*.tsx'],
      parserOptions: {
        project: ['./tsconfig.json']
      }
    }
  ],
  rules: {
    "max-len": ["error", { "code": 180, "tabWidth": 2 }],
    "arrow-body-style": "off",
    "comma-dangle": "off",
    "prefer-destructuring": "off",
    "@typescript-eslint/comma-dangle": "off",
    "react/prop-types": "off",
    "react/jsx-boolean-value": "off",
    "react/jsx-props-no-spreading": "off",
    "react/destructuring-assignment": "off",
    "import/no-extraneous-dependencies": "off",
    "import/prefer-default-export": "off"
  },
  ignorePatterns: [
    '.eslintrc.js',
    'craco.config.js',
    'jest.config.js',
    'node_modules'
  ]
};
