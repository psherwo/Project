#Riparian Forest Project



#Packages----
library(readr)
library(dplyr)



#Functions----
    #Writes a function to merge multiple dataframes at once
  multmerge = function(mypath){
    filenames=list.files(path=mypath, full.names=TRUE)
    datalist = lapply(filenames, function(x){read.csv(file=x,header=T)})
    Reduce(function(x,y) {merge(x,y)}, datalist)}
  
  cook.dat.test = multmerge("C:/Users/Parker/Documents/QuantMethods/data/Project Data")
   
#Opens Data----
vert_dat <- read_csv("data/Project Data/vert.dat.csv")
View(vert_dat)

invert_dat <- read_csv("data/Project Data/invert.dat.csv")
View(invert_dat)

transect_dat <- read_csv("data/Project Data/transect.dat.csv")
View(transect_dat)

pool_dat <- read_csv("data/Project Data/pool.dat.csv")

View(pool_dat)




#Table Paramter Descriptions----
  #Vert_dat= Fish and Salamander data----
    #Site = Survey Site
      #Sites:Cook Creek, Fritz Creek, 
      #LO701(Harvest block LO701 on Lookout Creek), LO703,Mack Creek,
      #MCT_E(McRae Cr. East Trib), MCT_W, MR404(McRae Cr Har. Block)
      #STR(McRae Cr. harv. block L504)

    #Reach.type = forest type
      #OG = Old Growth
      #SG = Second Growth
    
    #Marked_unmarked
      #Fish marked or unmarked during recapture surveys
    
    #Vert_No 
      #Unique vertebrate number by site, reach, data
    
    #Species 
      #Cott = Cottus (freshwater sculpin)
      #ONCL = Oncorhyncus clarkii clarkii (cuthroat trout)
      #DITE = Dicamptodon tenebrosus (coastal giant salamander)
    
    #SP_Lifestage
      #A = adult cuthroat
      #J = juvenile cuthroat (<1 year old)
      #N = age not taken for salamnders or sculpin

    #Vent_Length = vent length of salamanders in cm
    
    #Tail_Length = tail length of fish in cm
    
    #Weight = weight in grams
        
  #Invert_Dat = Invertabrate Data----
    #Site= see vert dat

    #Reach type = see vert dat
    #Date

    #Invert_No = unique number for the invertabrates

    #Taxa=taxonomic classification identified to the 
      #finest taxonomic rank
    #Inv_Lifestage= Lifestage of Invert
      #A = adult, L= larvae, P= Pupae, N= not noted
    #Converted Length = length of inverts after correcting for mag.
    #Tot_CNT = number of invert with this length


    
  #transect_dat= transect data----
    #Meter= location of transect,0 is the upstream end of the reach
    #Canopy_cover = canopy cover in percent
    #Chl_A_Tiles = chlrophyl growth on ceramic tiles in a 6 week 
      #time period in micrograms per squared centimeter
  

  #wood_dat = data collected on large wood ----
    #wood_piece = unique number for piece of wood sampled
      #diameter_1 = diameter at one end of wood sample
      #diameter_2 = diameter at other end
      #wood_length 
      

  #pool_dat= data on pools in streams ----
    #pool_no = unique number for pool sampled
    #depth_max = max depth of the pool sampled in cm
    #depth_outflow = depth of pool at the outflow
    #depth_residual = difference between max depth and resid depth
    #pool_length = length of pool (parallel to stream flow)
    #width = width of pool (perpindicular to stream flow)

#Filter data sets to each specific site
  #Cook Creek----
    cook.vert = vert_dat[vert_dat$SITE == "COOK", ]
    cook.invert = invert_dat[invert_dat$SITE == "COOK", ]
    cook.transect = transect_dat[transect_dat$SITE == "COOK", ]
    cook.pool = pool_dat[pool_dat$SITE == "COOK", ]

      #Remove unwanted paramaters
      cook.vert = cook.vert %>% select(-MARKED_UNMARKED,
              -ENTITY, -DBCODE, -SURVEY_METHOD)
   
      cook.invert = cook.invert %>% select(-DBCODE, -ENTITY, -LR_SUB,
       -SUBSAMPLE_AREA, -TAXA_RANK, -SUBSAMPLE_PROPORTION,
       -INVERT_LENGTH, -MAG, -TOT_CNT, -INV_LIFESTAGE)

      cook.transect = cook.transect %>% select(-ENTITY, -DBCODE, 
       -BANKFULL_WIDTH, -WETTED_WIDTH,-DATE_DEPLOYED_TILES,
        -DATE_RETRIEVED_TILES)

      cook.pool = cook.pool %>% select(-ENTITY, -DBCODE)

      #Renaming columns
        cook.invert = cook.invert %>% rename(INVERT_LENGTH = CONVERTED_LENGTH)
        cook.vert = cook.vert %>% rename(VERT_SP = SPECIES)
        cook.transect =cook.transect %>% rename(ALGAE_GROWTH = CHL_A_TILES)
  
  #Fritz Creek----
        fritz.vert = vert_dat[vert_dat$SITE == "FRITZ", ]
        fritz.invert = invert_dat[invert_dat$SITE == "FRITZ", ]
        fritz.transect = transect_dat[transect_dat$SITE == "FRITZ", ]
        fritz.pool = pool_dat[pool_dat$SITE == "FRITZ", ]
        
        #Remove unwanted paramaters
        fritz.vert = fritz.vert %>% select(-MARKED_UNMARKED,
                                         -ENTITY, -DBCODE, -SURVEY_METHOD)
        
        fritz.invert = fritz.invert %>% select(-DBCODE, -ENTITY, -LR_SUB,
                                             -SUBSAMPLE_AREA, -TAXA_RANK, -SUBSAMPLE_PROPORTION,
                                             -INVERT_LENGTH, -MAG, -TOT_CNT, -INV_LIFESTAGE)
        
        fritz.transect = fritz.transect %>% select(-ENTITY, -DBCODE, 
                                                 -BANKFULL_WIDTH, -WETTED_WIDTH,-DATE_DEPLOYED_TILES,
                                                 -DATE_RETRIEVED_TILES)
        
        fritz.pool = fritz.pool %>% select(-ENTITY, -DBCODE)
        
        #Renaming columns
        fritz.invert = fritz.invert %>% rename(INVERT_LENGTH = CONVERTED_LENGTH)
        fritz.vert = fritz.vert %>% rename(VERT_SP = SPECIES)
        fritz.transect = fritz.transect %>% rename(ALGAE_GROWTH = CHL_A_TILES)
    
  #Lo701----
        lo701.vert = vert_dat[vert_dat$SITE == "LO701", ]
        lo701.invert = invert_dat[invert_dat$SITE == "LO701", ]
        lo701.transect = transect_dat[transect_dat$SITE == "LO701", ]
        lo701.pool = pool_dat[pool_dat$SITE == "LO701", ]
        
     #Removing unwanted parameters
        lo701.vert = lo701.vert %>% select(-MARKED_UNMARKED,
                                           -ENTITY, -DBCODE, -SURVEY_METHOD)
        
        lo701.invert = lo701.invert %>% select(-DBCODE, -ENTITY, -LR_SUB,
                                               -SUBSAMPLE_AREA, -TAXA_RANK, -SUBSAMPLE_PROPORTION,
                                               -INVERT_LENGTH, -MAG, -TOT_CNT, -INV_LIFESTAGE)
        
        lo701.transect = lo701.transect %>% select(-ENTITY, -DBCODE, 
                                                   -BANKFULL_WIDTH, -WETTED_WIDTH,-DATE_DEPLOYED_TILES,
                                                   -DATE_RETRIEVED_TILES)
        
        lo701.pool = lo701.pool %>% select(-ENTITY, -DBCODE)
        
      #Renaming columns
        lo701.invert = lo701.invert %>% rename(INVERT_LENGTH = CONVERTED_LENGTH)
        lo701.vert = lo701.vert %>% rename(VERT_SP = SPECIES)
        lo701.transect = lo701.transect %>% rename(ALGAE_GROWTH = CHL_A_TILES)   
        
        
    
  #Lo703----
        lo703.vert = vert_dat[vert_dat$SITE == "LO703", ]
        lo703.invert = invert_dat[invert_dat$SITE == "LO703", ]
        lo703.transect = transect_dat[transect_dat$SITE == "LO703", ]
        lo703.pool = pool_dat[pool_dat$SITE == "LO703", ]
        
        #Removing unwanted parameters
        lo703.vert = lo703.vert %>% select(-MARKED_UNMARKED,
                                           -ENTITY, -DBCODE, -SURVEY_METHOD)
        
        lo703.invert = lo703.invert %>% select(-DBCODE, -ENTITY, -LR_SUB,
                                               -SUBSAMPLE_AREA, -TAXA_RANK, -SUBSAMPLE_PROPORTION,
                                               -INVERT_LENGTH, -MAG, -TOT_CNT, -INV_LIFESTAGE)
        
        lo703.transect = lo703.transect %>% select(-ENTITY, -DBCODE, 
                                                   -BANKFULL_WIDTH, -WETTED_WIDTH,-DATE_DEPLOYED_TILES,
                                                   -DATE_RETRIEVED_TILES)
        
        lo703.pool = lo703.pool %>% select(-ENTITY, -DBCODE)
        
        #Renaming columns
        lo703.invert = lo703.invert %>% rename(INVERT_LENGTH = CONVERTED_LENGTH)
        lo703.vert = lo703.vert %>% rename(VERT_SP = SPECIES)
        lo703.transect = lo703.transect %>% rename(ALGAE_GROWTH = CHL_A_TILES)   
        
  #Mack Creek----
        mack.vert = vert_dat[vert_dat$SITE == "MACK", ]
        mack.invert = invert_dat[invert_dat$SITE == "MACK", ]
        mack.transect = transect_dat[transect_dat$SITE == "MACK", ]
        mack.pool = pool_dat[pool_dat$SITE == "MACK", ]
        
        #Removing unwanted parameters
        mack.vert = mack.vert %>% select(-MARKED_UNMARKED,
                                           -ENTITY, -DBCODE, -SURVEY_METHOD)
        
        mack.invert = mack.invert %>% select(-DBCODE, -ENTITY, -LR_SUB,
                                               -SUBSAMPLE_AREA, -TAXA_RANK, -SUBSAMPLE_PROPORTION,
                                               -INVERT_LENGTH, -MAG, -TOT_CNT, -INV_LIFESTAGE)
        
        mack.transect = mack.transect %>% select(-ENTITY, -DBCODE, 
                                                   -BANKFULL_WIDTH, -WETTED_WIDTH,-DATE_DEPLOYED_TILES,
                                                   -DATE_RETRIEVED_TILES)
        
        mack.pool = mack.pool %>% select(-ENTITY, -DBCODE)
        
        #Renaming columns
        mack.invert = mack.invert %>% rename(INVERT_LENGTH = CONVERTED_LENGTH)
        mack.vert = mack.vert %>% rename(VERT_SP = SPECIES)
        mack.transect = mack.transect %>% rename(ALGAE_GROWTH = CHL_A_TILES)   
  #MCT_E----
        mct_e.vert = vert_dat[vert_dat$SITE == "MCT_E", ]
        mct_e.invert = invert_dat[invert_dat$SITE == "MCT_E", ]
        mct_e.transect = transect_dat[transect_dat$SITE == "MCT_E", ]
        mct_e.pool = pool_dat[pool_dat$SITE == "MCT_E", ]
        
        #Removing unwanted parameters
        mct_e.vert = mct_e.vert %>% select(-MARKED_UNMARKED,
                                         -ENTITY, -DBCODE, -SURVEY_METHOD)
        
        mct_e.invert = mct_e.invert %>% select(-DBCODE, -ENTITY, -LR_SUB,
                                             -SUBSAMPLE_AREA, -TAXA_RANK, -SUBSAMPLE_PROPORTION,
                                             -INVERT_LENGTH, -MAG, -TOT_CNT, -INV_LIFESTAGE)
        
        mct_e.transect = mct_e.transect %>% select(-ENTITY, -DBCODE, 
                                                 -BANKFULL_WIDTH, -WETTED_WIDTH,-DATE_DEPLOYED_TILES,
                                                 -DATE_RETRIEVED_TILES)
        
        mct_e.pool = mct_e.pool %>% select(-ENTITY, -DBCODE)
        
        #Renaming columns
        mct_e.invert = mct_e.invert %>% rename(INVERT_LENGTH = CONVERTED_LENGTH)
        mct_e.vert = mct_e.vert %>% rename(VERT_SP = SPECIES)
        mct_e.transect = mct_e.transect %>% rename(ALGAE_GROWTH = CHL_A_TILES)   
  #MCT_W----
        mct_w.vert = vert_dat[vert_dat$SITE == "MCT_W", ]
        mct_w.invert = invert_dat[invert_dat$SITE == "MCT_W", ]
        mct_w.transect = transect_dat[transect_dat$SITE == "MCT_W", ]
        mct_w.pool = pool_dat[pool_dat$SITE == "MCT_W", ]
        
        #Removing unwanted parameters
        mct_w.vert = mct_w.vert %>% select(-MARKED_UNMARKED,
                                           -ENTITY, -DBCODE, -SURVEY_METHOD)
        
        mct_w.invert = mct_w.invert %>% select(-DBCODE, -ENTITY, -LR_SUB,
                                               -SUBSAMPLE_AREA, -TAXA_RANK, -SUBSAMPLE_PROPORTION,
                                               -INVERT_LENGTH, -MAG, -TOT_CNT, -INV_LIFESTAGE)
        
        mct_w.transect = mct_w.transect %>% select(-ENTITY, -DBCODE, 
                                                   -BANKFULL_WIDTH, -WETTED_WIDTH,-DATE_DEPLOYED_TILES,
                                                   -DATE_RETRIEVED_TILES)
        
        mct_w.pool = mct_w.pool %>% select(-ENTITY, -DBCODE)
        
        #Renaming columns
        mct_w.invert = mct_w.invert %>% rename(INVERT_LENGTH = CONVERTED_LENGTH)
        mct_w.vert = mct_w.vert %>% rename(VERT_SP = SPECIES)
        mct_w.transect = mct_w.transect %>% rename(ALGAE_GROWTH = CHL_A_TILES)   
  #MR404----
        mr404.vert = vert_dat[vert_dat$SITE == "MR404", ]
        mr404.invert = invert_dat[invert_dat$SITE == "MR404", ]
        mr404.transect = transect_dat[transect_dat$SITE == "MR404", ]
        mr404.pool = pool_dat[pool_dat$SITE == "MR404", ]
        
        #Removing unwanted parameters
        mr404.vert = mr404.vert %>% select(-MARKED_UNMARKED,
                                           -ENTITY, -DBCODE, -SURVEY_METHOD)
        
        mr404.invert = mr404.invert %>% select(-DBCODE, -ENTITY, -LR_SUB,
                                               -SUBSAMPLE_AREA, -TAXA_RANK, -SUBSAMPLE_PROPORTION,
                                               -INVERT_LENGTH, -MAG, -TOT_CNT, -INV_LIFESTAGE)
        
        mr404.transect = mr404.transect %>% select(-ENTITY, -DBCODE, 
                                                   -BANKFULL_WIDTH, -WETTED_WIDTH,-DATE_DEPLOYED_TILES,
                                                   -DATE_RETRIEVED_TILES)
        
        mr404.pool = mr404.pool %>% select(-ENTITY, -DBCODE)
        
        #Renaming columns
        mr404.invert = mr404.invert %>% rename(INVERT_LENGTH = CONVERTED_LENGTH)
        mr404.vert = mr404.vert %>% rename(VERT_SP = SPECIES)
        mr404.transect = mr404.transect %>% rename(ALGAE_GROWTH = CHL_A_TILES)        
  
  #STR----
        str.vert = vert_dat[vert_dat$SITE == "STR", ]
        str.invert = invert_dat[invert_dat$SITE == "STR", ]
        str.transect = transect_dat[transect_dat$SITE == "STR", ]
        str.pool = pool_dat[pool_dat$SITE == "STR", ]
        
        #Removing unwanted parameters
        str.vert = str.vert %>% select(-MARKED_UNMARKED,
                                           -ENTITY, -DBCODE, -SURVEY_METHOD)
        
        str.invert = str.invert %>% select(-DBCODE, -ENTITY, -LR_SUB,
                                               -SUBSAMPLE_AREA, -TAXA_RANK, -SUBSAMPLE_PROPORTION,
                                               -INVERT_LENGTH, -MAG, -TOT_CNT, -INV_LIFESTAGE)
        
        str.transect = str.transect %>% select(-ENTITY, -DBCODE, 
                                                   -BANKFULL_WIDTH, -WETTED_WIDTH,-DATE_DEPLOYED_TILES,
                                                   -DATE_RETRIEVED_TILES)
        
        str.pool = str.pool %>% select(-ENTITY, -DBCODE)
        
        #Renaming columns
        str.invert = str.invert %>% rename(INVERT_LENGTH = CONVERTED_LENGTH)
        str.vert = str.vert %>% rename(VERT_SP = SPECIES)
        str.transect = str.transect %>% rename(ALGAE_GROWTH = CHL_A_TILES)        
        
        
        
        
        
