#Riparian Forest Project






#Rename tables
  #Renamed tables to understandable titles

#Opens Data----
View(vert_dat)
View(invert_dat)
View(transect_dat)
View(wood_dat)
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
  
    
#Remove some of the paramters from the dataset to reduce clutter
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