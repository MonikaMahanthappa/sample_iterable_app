# README

To start the application

*Requirements*
- Ruby version 3.1.3
- Rails version 7.1.0

1. **Set Environment Variable:**

   Open your terminal and set the environment variable using the `export` command. Replace `"YOUR_API_KEY"` with your actual API key:

   ```bash
   export iterable_api_key="YOUR_API_KEY"
   export iterable_api_base_url="YOUR_API_BASE_URL"

2. **Install all dependencies**

   ```bash
   bundle install

3. **Run migrations**
   ```bash
   rails db:migrate

5. **Start server**
    ```bash
   rails server
