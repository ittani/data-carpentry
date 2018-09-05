library("tidyverse")
str(surveys)
#select columns
select(surveys,species_id,weight)
#select rows
filter(surveys, year==1995)

# pipes: %>%

surveys %>% 
  filter( year==1995) %>% 
  select(species_id,weight)

exercise <- surveys %>%
filter(weight<5) %>% 
 select(species_id,weight,sex)

#mutate()
 
data_with_kg <- surveys %>% 
  mutate(weight_kg=weight/1000)

surveys %>% 
  mutate(weight_kg=weight/1000, weight_kg2=weight_kg*2)

surveys %>% 
  mutate(weight_kg=weight/1000, weight_kg2=weight_kg*2) %>% 
  head()

surveys %>% 
  filter(!is.na(weight)) %>% 
  mutate(weight_kg=weight/1000, weight_kg2=weight_kg*2) %>% 
  head() 

surveys %>% 
  filter(!sex=="")
   group_by(sex) %>% 
  summarise(mean_weight=mean(weight, na.rm=TRUE))


#REMOVE the missing values first(using filter), and re-run
#group by two coloumns

summarise_two <- surveys %>% 
  filter(sex=="F" | sex=="M") %>% 
  group_by(sex,species_id) %>% 
   summarise(mean_weight=mean(weight, na.rm=TRUE))


                            
  surveys %>% 
  filter(!sex=="") %>% 
  filter(!is.na(weight)) %>%                           
  group_by(sex,species_id) %>% 
  summarise(mean_weight=mean(weight))

  summarise_two <- surveys %>% 
    filter(!sex=="") %>% 
    filter(!is.na(weight)) %>% 
    group_by(sex,species_id) %>% 
    summarise(mean_weight=mean(weight),min_weight=min(weight))
  
  #counting
  surveys %>% 
    filter(!sex=="")
  count(sex)
  
  
  #count with two variables
  surveys %>% 
    filter(!sex=="")
  count(sex,species)
  
  #sorting(arrange())
  surveys %>%
    filter(!sex=="") %>% 
  count(sex,species) %>% 
    arrange(species,desc(n))
    
  #reshaping the data
  
  
  