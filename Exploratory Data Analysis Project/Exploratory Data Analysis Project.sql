-- Exploratory Data Analysis

select *
from layoffs_staging2;

select max(total_laid_off), max(percentage_laid_off)
from layoffs_staging2;

select *
from layoffs_staging2
where percentage_laid_off = 1
order by total_laid_off desc;

select *
from layoffs_staging2
where percentage_laid_off = 1
order by funds_raised_millions desc;

select company,sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

select min(`date`), max(`date`)
from layoffs_staging2;

select industry,sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

select *
from layoffs_staging2;

select country,sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

select `date`,sum(total_laid_off)
from layoffs_staging2
group by `date`
order by 1 desc;

select year(`date`), sum(total_laid_off)
from layoffs_staging2
group by year(`date`)
order by 1 desc;

select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 1 desc;

select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2 desc;

select country,sum(percentage_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

select *
from layoffs_staging2;

select substring(`date`,6,2) as `month`, sum(total_laid_off)
from layoffs_staging2
group by `month`;

select substring(`date`,1,7) as `month`, sum(total_laid_off)
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `month`
order by 1 asc;

with Rolling_Totals as
(
select substring(`date`,1,7) as `month`, sum(total_laid_off) as Total_off
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `month`
order by 1 asc
)
select `month`,Total_off, sum(Total_off) over(order by `month`) as Rolling_Total
from Rolling_Totals;

select company,sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

select company, year(`date`),sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
order by company desc;

select company, year(`date`),sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
order by 3 desc;

with Company_Year (company,years, total_laid_off)as
(
select company, year(`date`),sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
)
select * ,dense_rank() over(partition by years order by total_laid_off desc) as Ranking
from Company_Year
where years is not null
order by Ranking asc;

with Company_Year (company,years, total_laid_off)as
(
select company, year(`date`),sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
), 
Company_Year_Rank as
(
select * ,dense_rank() over(partition by years order by total_laid_off desc) as Ranking
from Company_Year
where years is not null
)
select *
from Company_Year_Rank
where Ranking<=5;

























































































