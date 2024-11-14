# AIclinix

A Rails app that helps healthcare professionals with AI-powered diagnostics.

## What it does

AIclinix combines AI with medical expertise to help with:
- Predicting risks for common conditions like heart disease and diabetes
- Providing healthcare recommendations
- Visualizing predictions to make them easier to understand
- Managing patient data securely
- Supporting real-time diagnostic decisions

## Tech stack

- Ruby on Rails
- PostgreSQL database
- Django REST API for machine learning models
- JavaScript for data visualization

## Getting started

1. Install dependencies:
   - Ruby (check .ruby-version for correct version)
   - PostgreSQL
   - Node.js

2. Set up your environment:
   ```bash
   # Install gems
   bundle install

   # Set up database
   rails db:create db:migrate

   # Install frontend packages
   yarn install
   ```

3. Start the server:
   ```bash
   rails server
   ```

4. Visit `localhost:3000` in your browser

## Development

- Run tests: `rails test`
- Check code style: `rubocop`
- Start development server with hot reload: `rails server`

## Want to help?

We'd love your input! Whether you're a healthcare professional or a developer, you can help make AIclinix better. Feel free to:
- Open issues for bugs or feature requests
- Submit pull requests
- Share your feedback

## Questions?

[Create an issue](https://github.com/yourusername/aiclinix/issues) or reach out to me.
