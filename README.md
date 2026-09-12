# Fashion E-Commerce Product Analytics & Customer Experience Optimization

## 📌 Project Overview

A product analytics case study for a simulated fashion e-commerce platform.

The project analyzes the customer journey from search and product discovery to cart, checkout, payment, purchase and returns to identify major drop-off points and customer experience opportunities.

## 🎯 Business Objective

The analysis focuses on:

- Identifying major customer funnel drop-offs
- Understanding customer behavior across devices
- Analyzing product category performance
- Evaluating payment behavior
- Identifying major return reasons
- Translating data insights into product improvement opportunities

## 🛠️ Tools & Technologies

- SQL / MySQL
- Microsoft Excel
- Power BI
- Figma
- Product Analytics
- Agile / Scrum

## 📊 Customer Funnel

| Stage | Users |
|---|---:|
| Search | 20 |
| Product View | 20 |
| Add to Cart | 19 |
| Checkout | 17 |
| Payment | 15 |
| Purchase | 8 |

### Key Insight

The largest funnel drop-off occurs between **Payment and Purchase**, with approximately **47% abandonment** at this stage.

This indicates that the checkout and payment experience should be investigated as a high-priority product opportunity.

## 🔍 Product Insights

### Device Behavior

Mobile users represent the majority of customers and purchases in the simulated dataset, making mobile experience optimization an important product priority.

### Category Performance

Jeans, Dresses, Ethnic Wear and Sarees generated purchases, while T-Shirts and Jackets showed customer interactions without purchases.

### Returns

The most common return reason was **Size/Fit**, suggesting an opportunity to improve size guides and fit recommendations.

## 💡 Product Recommendations

### 1. Improve Checkout & Payment

- Clear payment status
- Better payment error messages
- Faster checkout
- Easy payment retry

### 2. Improve Size & Fit

- Size recommendation
- Detailed size guide
- Fit information
- Measurement guidance

### 3. Improve Search & Discovery

- Trending searches
- Personalized recommendations
- Category shortcuts
- Better product discovery

## 👤 User Stories

**Shopper Search**

As a shopper, I want relevant search suggestions so that I can discover products faster.

**Payment**

As a shopper, I want clear payment status so that I know whether my payment was successful.

**Size Recommendation**

As a shopper, I want size recommendations so that I can select the correct size confidently.

## 📈 KPIs

The following metrics can be used to evaluate product improvements:

- Search-to-View Conversion
- View-to-Cart Conversion
- Cart-to-Checkout Conversion
- Checkout-to-Payment Conversion
- Payment-to-Purchase Conversion
- Overall Purchase Conversion
- Return Rate
- Size/Fit Return Rate

## 🎨 Figma Prototype

A low-fidelity mobile search and discovery prototype was designed to explore improvements to the shopping experience.

**Prototype:** [View Figma Prototype](https://www.figma.com/design/ZfimVD9OjFxBKnGb9cMW2V/Untitled?node-id=1-2&t=V8z2m0IrGV55CMIM-1)

## 📁 Project Structure

```text
Fashion-Ecommerce-Product-Analytics/
│
├── data/
│   ├── customers.csv
│   ├── products.csv
│   ├── events.csv
│   ├── orders.csv
│   ├── returns.csv
│   └── excel/
│       └── Fashion_Ecommerce_Analysis.xlsx
│
├── sql/
│   ├── 01_funnel_analysis.sql
│   └── 02_product_insights.sql
│
├── powerbi/
│   └── Fashion_Ecommerce_Analytics.pbix
│
├── Figma/
│   └── Fashion Search - Improved.png
│
└── Product_Requirements_and_Insights.txt
