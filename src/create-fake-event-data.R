ACS_events <- 
  map(.x = 1:300,
    .f = ~runif(n = rpois(n = 1, lambda = 2),
                min = 0,
                max = 1000)) %>% 
  flatten_dbl() %>% 
  ceiling() %>% 
  {. + as.Date("2015-01-01")} %>% 
  sort() %>% 
  enframe(name = "id", value = "ref_date") %>% 
  mutate(blood_type = sample(x = c("O", "A", "B"),
                             size = n(), 
                             replace = TRUE))

PM25 <- 
  tibble(date = seq(from = min(ACS_events$ref_date) - 8,
                  to = max(ACS_events$ref_date) + 8,
                  by = "day")) %>% 
  mutate(PM25 = rnorm(n = n(), 
                      mean = 10,
                      sd = 4))
  
  # ACS_events %>% 
  # select(date = ref_date) %>% 
  # group_by(date) %>% 
  # summarize(PM25 = rnorm(n = 1, 
  #                     mean = 10,
  #                     sd = 4)) 

# ACS_events <- 
#   ACS_events %>% 
#   select(-PM25)

# 
# ACS_events %>% 
#   mutate(id_date = map(.x = ref_date,
#                        .f = ~ {
#                          row_refdate <- .x
#                          month_dates <- seq(from = floor_date(.x, "month"),
#                                             to = rollback(ceiling_date(.x, "month")),
#                                             by = "day")
#                          keep(month_dates, ~ wday(.x) == wday(row_refdate))
#                        })) %>% 
#   unnest(id_date) %>% 
#   arrange(id, id_date)
#   


