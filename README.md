# AmazingMart Sales Analytics

## Overview
This project provides a comprehensive data pipeline for analyzing sales, orders, and performance metrics for AmazingMart. It leverages dbt (Data Build Tool) to transform raw sales data into organized models for reporting and decision-making.

## Project Structure

### Models
The project contains the following core models:

1. **`ListOfOrders`**
   - Description: Contains details about customer orders, including order information, customer details, and shipping data.
   - Key Fields:
     - `orderid`: Unique identifier for each order.
     - `orderdate`: Date when the order was placed.
     - `customername`: Name of the customer.
     - `city`, `state`, `country`, `region`: Customer location details.
     - `shipdate`: Shipping date for the order.
     - `shipmode`: Shipping method.

2. **`OrderBreakdown`**
   - Description: Provides detailed information about the products in each order, including sales, discounts, and profit.
   - Key Fields:
     - `orderid`: Links to `ListOfOrders`.
     - `productname`: Name of the product in the order.
     - `category`, `subcategory`: Product classification.
     - `sales`, `profit`: Financial metrics.
     - `discount`, `quantity`: Order-specific details.

3. **`SalesTargets`**
   - Description: Contains target sales data categorized by month and product category.
   - Key Fields:
     - `MonthofOrderDate`: Month corresponding to the order date.
     - `Category`: Product category for which the target is defined.
     - `Target`: Sales target for the given category and month.

## Key Queries

### Example Analyses
Here are some key queries built using the models:

1. **Monthly Sales Performance vs Targets**
   - Compares actual sales to predefined targets to identify gaps or achievements.
   - Utilizes the `ListOfOrders`, `OrderBreakdown`, and `SalesTargets` models.

2. **Order Delay Analysis**
   - Calculates shipping delays to evaluate fulfillment efficiency.
   - Leverages `orderdate` and `shipdate` from the `ListOfOrders` model.

3. **Top Customers by Profit**
   - Identifies the customers contributing the most profit.
   - Aggregates profit from the `OrderBreakdown` model.

4. **Category Contribution to Sales and Profit**
   - Analyzes the contribution of each category to overall sales and profitability.
   - Derived from the `OrderBreakdown` model.

### SQL Adjustments
All date-related fields are explicitly cast to `DATE` to ensure compatibility with functions like `DATE_DIFF` and `DATE_TRUNC`.

## Prerequisites

### Tools
- **dbt Core**: For running transformations.
- **Database**: Ensure access to a supported database (e.g., BigQuery, Snowflake).
- **Source Data**: Raw data tables:
  - `AmazingMartSales.ListOfOrders`
  - `AmazingMartSales.OrderBreakdown`
  - `AmazingMartSales.SalesTargets`

### Installation
1. Clone this repository:
   ```bash
   git clone <https://github.com/vmose/AmazingMartEU>
   cd amazingmart-sales-analytics
   ```
2. Install dbt:
   ```bash
   pip install dbt-core
   ```
3. Set up your dbt profile in `~/.dbt/profiles.yml`.

## Usage

### Running the Models
1. Run all models:
   ```bash
   dbt run
   ```
2. Test the models:
   ```bash
   dbt test
   ```
3. Generate documentation:
   ```bash
   dbt docs generate
   ```
4. View documentation:
   ```bash
   dbt docs serve
   ```

### Development Workflow
1. Modify or add SQL models in the `models/` directory.
2. Run specific models for testing:
   ```bash
   dbt run --select <model_name>
   ```
3. Validate outputs using dbt tests and by inspecting data.

## Testing
The project includes column-level tests for nullability and uniqueness for key fields such as `orderid` in `ListOfOrders` and `OrderBreakdown`.

## Future Enhancements
1. Add time-series analyses for forecasting.
2. Enhance profitability analysis by incorporating more granular metrics.
3. Implement tests for referential integrity between models.
4. Automate deployment using CI/CD pipelines.

## Contributors
- [Victor Mose](mailto:vicmose.vm@gmail.com)

---

For any questions or feedback, please reach out via email or submit an issue in this repository.
