module.exports = {
    extends: ['eslint:recommended', 'plugin:@typescript-eslint/recommended'],
    parser: '@typescript-eslint/parser',
    parserOptions: {project: ['./tsconfig.eslint.json']},
    plugins: ['@typescript-eslint'],
    root: true,
};
