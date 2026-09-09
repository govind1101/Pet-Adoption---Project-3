CREATE TABLE pet_adoption_data(
	pet_id VARCHAR(50),
	pet_type VARCHAR(50),
	breed VARCHAR(100),
	age_months INTEGER,
	color VARCHAR(50),
	pet_size VARCHAR(20),
	weight_kg DECIMAL(10,2),
	vaccinated INTEGER,
	health_condition INTEGER,
	time_in_shelter_days INTEGER,
	adoption_fee DECIMAL(10,2),
	previous_owner INTEGER,
	adoption_liklihood INTEGER
);

-- Check Imported Data --

Select *
From pet_adoption_data
Limit 12;

Select COUNT(*)
From pet_adoption_data;

-- Business Questions --

-- 1. How many pets are represented in the data? --
Select COUNT(*) AS total_pets
From pet_adoption_data;
-- There are 2,007 pets that are being shown in the data. --

-- 2. How Many pets are represented for each pet type? -- 
Select
	pet_type,
	COUNT(*) AS pet_count
From pet_adoption_data
Group By pet_type
Order By pet_count DESC;
-- There are 487 birds, 493 Rabbits, 505 Cats, and 522 Dogs represented. --

-- 3. What is the average adoption fee for each pet type? --
Select
	pet_type,
	ROUND(AVG(adoption_fee), 2) AS average_adoption_fee
From pet_adoption_data
Group By pet_type
Order By average_adoption_fee Desc;
-- From the data, it is 261.80 to adopt a bird, 247.52 for a dog, 247.26 for cats, and 240.28 for Rabbits.

-- 4. Which breeds have the most pets in the dataset? --
Select
	breed,
	COUNT(*) AS pet_count
From pet_adoption_data 
Group By breed
Order By pet_count DESC;
-- It seems, when looking at the dataset, rabbit have the most pets at 493 pets. --

-- 5. What is the average time spent in the shelter for each pet type --
Select
	pet_type,
	ROUND(AVG(time_in_shelter_days), 2) AS average_shelter_days
From pet_adoption_data
Group By pet_type
Order By average_shelter_days DESC;
-- The most time, on average, is spent by rabbits with around 45 days at the shelter. Dog spent about 44 days while birds and cats spent about 43 days respectively. --

-- 6. How many pets have each vaccination status within each pet type? --
Select
	pet_type,
	vaccinated,
	COUNT(*) AS pet_count
From pet_adoption_data
Group By pet_type, vaccinated
Order By pet_type, vaccinated;
-- The dataset shows that most birds, cats, dogs, and rabbits were vaccinated, while fewer were not. --

-- 7. What is the average age of pets based on whether they have a previous owner? --
Select 
	previous_owner,
	ROUND(AVG(age_months), 2) AS average_age_months
From pet_adoption_data
Group By previous_owner
Order By previous_owner;
-- The average age of pets without previous owners was about 91 months old while those with previous owners was 95 months old. --