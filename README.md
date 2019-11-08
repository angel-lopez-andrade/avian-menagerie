# README

## Avian Menagerie

### Links
Avian Menagerie: https://avian-menagerie.herokuapp.com/
Angel Lopez-Andrade GitHub: https://github.com/poklipart

### Description
This application is built for people who wish to buy or sell birds, buy snacks and cages for their birds, add to a community database of bird breed by recording any breed that they encounter, and discuss different bird breed with others online. The following user stories are encompassed, and explain various scenarios in which people have relevant issues, and their reasons for wanting to use this application to solve them;

- I am moving house and I’d like to sell some of my birds off to other people.
- I am a single man and I’d like to purchase a pet that doesn’t create a large mess like a bird.
- I am a bird enthusiast and I’d like to further the cause of exposing people to more bird varieties by contributing info of bird breed I know into a database.
- I have a bird of a certain breed and I’d like to talk about things such as how to best feed that breed with others also interested in that specific breed.

The purpose of this application is to successfully fulfill these user stories.

### Functions
Application functions include;
- Purchase Birds, Snacks, Cages
- Sell Birds
- View Bird Species, Individual Birds, Snack Varieties, Indiviual Snacks, Cage Varieties, Invidual Cages
- Record Bird Species
- Discuss Bird Species with others

### Sitemap
![Sitemap](./docs/sitemap.png)

### Screenshots
![Screenshot1](./docs/screenshot1.png)
![Screenshot2](./docs/screenshot2.png)
![Screenshot3](./docs/screenshot3.png)
![Screenshot4](./docs/screenshot4.png)

### Wireframes
![Wireframes1](./docs/wireframes1.png)
![Wireframes2](./docs/wireframes2.png)
![Wireframes3](./docs/wireframes3.png)
![Wireframes4](./docs/wireframes4.png)

### ERD
![ERD](./docs/erd1.png)

### High-level components
This application uses the Model-View-Controller (MVC) architecture pattern. The model for each data variety is synced up with an equivalent table in the PostgreSQL database, and declares relations with other models, following the ERD, as well as containing a bit of editing control in checking for the presence of certain fields when it is called by the controller in order to create a new record. The views for each data variety are made in order to cover as much CRUD resource functionality as deemed necessary by the applications designated scope. They present a visual HTML/CSS structure with input from the database via embedded Ruby that add varying data to each different page, dependent upon parameters passed to it by the controller. The controller links the model and the view - retrieving specified data from the database via the model, and then manipulating that data in order to make it easier to process before passing it onto the view, via instance variables and the params array (populated by HTTP request body's/URL query parameters), for display to the user.

### Third-Party Services
This application uses a number of third-party services. Stripe is employed as a platform for accepting payments and the authorised usage of user credit card data. Ultrahook is used in testing to provide a webhook through which to connect Stripe payments through. Devise is used for user authentication functionality. Heroku is used to deploy the application onto an online domain. Faker is used to provide information for realistic fake data seeding. Down is used to safely download image files off APIs.

### Models and Active Record associations
Model relations within this application are built upon the ERD. Models that belong to another model have the syntax 'belongs_to: :belonger', as well as having a foreign key column with the data type 'references'. Models that have records of other models, however, do not have such foreign keys, and are dependent on the former type of syntax in order to declare the relationship on their side. Those that have a single record of another model have 'has_one :belongee', whereas those that have multiple records of another model have 'has_many :belongees'. Finally, stored pictures utilise the automated Active Record tables of 'active_storage_attachments' and 'active_storage_blobs' - the former of which holds picture metadata, and the latter of which contains an external reference to the actual picture data (stored in AWS S3), as well as the model syntax 'has_one_attached :pic'.

### Database relations
Database relations within this application are also built upon the ERD. Each Rails model has an equivalent PostgreSQL table, which holds the automated 'id' of each record, as well as information about the values and data-types of each column within each of those records. Unlike the model side of things, "belonger" tables do not have an explicitly declared relationship to their "belongee" tables, but are merely connected via the foreign key pointing towards themselves contained in the latter. These foreign keys declare the id of the belonger record/s that each belongee record is associated with.

### Database schema design


### Task allocation and tracking
The development of this application and task allocation/goal setting etc. was done via Trello.
![Trello](./docs/trello.png)

### Tech Stack
The tech stack used in this application comprises HTML, CSS, PostgreSQL, Ruby on Rails, Heroku and Stripe.