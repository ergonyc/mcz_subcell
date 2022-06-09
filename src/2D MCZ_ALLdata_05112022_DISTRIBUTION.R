#Things that need editing before each use:
# 1. Working directory: click "Session" -> "Set Working Directory" -> "Choose Directory" -> select the folder where you have the excel files that you want to work with for this session.
# 2. Your file names: Use the "Find/Replace" tab to easily change the date/file name in the file names when you are working with a different set of data that are processed on a different date
# 3. Then number of images included for 'doesntLD' object below
# 4. Your specific experiment number/code when writing 'clean' files at very end

library(tidyverse)
library(readr)
#Read ALL the excel files present in the folder into R at once. This step might take more than a few seconds depending on the size of your files.
data_files <- list.files(getwd())
for(i in 1:length(data_files)) {
  assign(data_files[i],
         read.csv(paste0(getwd(),"/", data_files[i])))
}


#selecting size and shape metrics from the individual organelle files:
ER <- `MCZ_hiPSCs_CellP2D_05192022_ER.csv` %>% 
    select(ImageNumber, AreaShape_Area, AreaShape_Eccentricity) %>% 
    group_by(ImageNumber) %>% summarise(ER_pixel_area = sum(AreaShape_Area), ER_mean_ecty = mean(AreaShape_Eccentricity))

# number_have_ER <- `MCZ_hiPSCs_CellP2D_05192022_ER.csv` %>%
#     select(ImageNumber, AreaShape_Area, ObjectNumber) %>% group_by(ImageNumber) %>% summarise()
# doesntER <- subset(data.frame(ImageNumber = 1:38), !(ImageNumber %in% number_have_ER$ImageNumber))
# unordered_ER <- doesntER %>% add_column(ER_total_area = NA, ER_mean_eccentricity = NA) %>% rbind(incomplete_ER)
# ER <- unordered_ER[with(unordered_ER, order(ImageNumber)),]


PO <- `MCZ_hiPSCs_CellP2D_05192022_PO.csv` %>% 
  select(ImageNumber, AreaShape_Area, AreaShape_Eccentricity, AreaShape_FormFactor, AreaShape_MajorAxisLength, AreaShape_MinorAxisLength) %>% 
  group_by(ImageNumber) %>% summarise(PO_pixel_area = sum(AreaShape_Area), PO_med_size = median(AreaShape_Area), PO_mean_ecty = mean(AreaShape_Eccentricity), PO_mean_FormF= mean(AreaShape_FormFactor), PO_mean_MajAxis= mean(AreaShape_MajorAxisLength), PO_mean_MinAxis= mean(AreaShape_MinorAxisLength))

# number_have_PO <- `MCZ_hiPSCs_CellP2D_05192022_PO.csv` %>%
#   select(ImageNumber, AreaShape_Area, ObjectNumber) %>% group_by(ImageNumber) %>% summarise()
# doesntPO <- subset(data.frame(ImageNumber = 1:38), !(ImageNumber %in% number_have_PO$ImageNumber))
# unordered_PO <- doesntPO %>% add_column(PO_total_area = NA, PO_median_size = NA, PO_mean_eccentricity = NA) %>% rbind(incomplete_PO)
# PO <- unordered_PO[with(unordered_PO, order(ImageNumber)),]

#LD <- `MCZ_hiPSCs_CellP2D_05192022_LD.csv` %>% 
#select(ImageNumber, AreaShape_Area, AreaShape_Eccentricity) %>% 
#group_by(ImageNumber) %>% summarise(LD_pixel_area = sum(AreaShape_Area), LD_med_size = median(AreaShape_Area), LD_mean_ecty = mean(AreaShape_Eccentricity))

incomplete_LD <- `MCZ_hiPSCs_CellP2D_05192022_LD.csv` %>% 
  select(ImageNumber, AreaShape_Area, AreaShape_Eccentricity, AreaShape_FormFactor, AreaShape_MajorAxisLength, AreaShape_MinorAxisLength) %>% 
  group_by(ImageNumber) %>% summarise(LD_pixel_area = sum(AreaShape_Area), LD_med_size = median(AreaShape_Area), 
                                      LD_mean_ecty = mean(AreaShape_Eccentricity), LD_mean_FormF= mean(AreaShape_FormFactor), LD_mean_MajAxis= mean(AreaShape_MajorAxisLength), LD_mean_MinAxis= mean(AreaShape_MinorAxisLength))

number_have_LD <- `MCZ_hiPSCs_CellP2D_05192022_LD.csv` %>%
  select(ImageNumber, AreaShape_Area, ObjectNumber) %>% group_by(ImageNumber) %>% summarise()
#change the number of the pictures:put the TOTAL number of images
doesntLD <- subset(data.frame(ImageNumber = 1:31), !(ImageNumber %in% number_have_LD$ImageNumber))

unordered_LD <- doesntLD %>% add_column(LD_pixel_area = NA, LD_med_size = NA, LD_mean_ecty = NA, LD_mean_FormF= NA, LD_mean_MajAxis= NA, LD_mean_MinAxis= NA) %>% rbind(incomplete_LD)

LD <- unordered_LD[with(unordered_LD, order(ImageNumber)),]



# GL <- `MCZ_hiPSCs_CellP2D_05192022_GL.csv` %>% 
# select(ImageNumber, AreaShape_Area, AreaShape_Eccentricity, AreaShape_FormFactor, AreaShape_MajorAxisLength, AreaShape_MinorAxisLength) %>% 
# group_by(ImageNumber) %>% summarise(GL_pixel_area = sum(AreaShape_Area), GL_med_size = median(AreaShape_Area), GL_mean_ecty = mean(AreaShape_Eccentricity),GL_mean_FormF= mean(AreaShape_FormFactor), GL_mean_MajAxis= mean(AreaShape_MajorAxisLength), GL_mean_MinAxis= mean(AreaShape_MinorAxisLength))

incomplete_GL <- `MCZ_hiPSCs_CellP2D_05192022_GL.csv` %>%
  select(ImageNumber, AreaShape_Area, AreaShape_Eccentricity, AreaShape_FormFactor, AreaShape_MajorAxisLength, AreaShape_MinorAxisLength) %>% 
  group_by(ImageNumber) %>% summarise(GL_pixel_area = sum(AreaShape_Area), GL_med_size = median(AreaShape_Area), GL_mean_ecty = mean(AreaShape_Eccentricity),GL_mean_FormF= mean(AreaShape_FormFactor), GL_mean_MajAxis= mean(AreaShape_MajorAxisLength), GL_mean_MinAxis= mean(AreaShape_MinorAxisLength))

number_have_GL <- `MCZ_hiPSCs_CellP2D_05192022_GL.csv` %>%
   select(ImageNumber, AreaShape_Area, ObjectNumber) %>% group_by(ImageNumber) %>% summarise()

doesntGL <- subset(data.frame(ImageNumber = 1:31), !(ImageNumber %in% number_have_GL$ImageNumber))

unordered_GL <- doesntGL %>% add_column(GL_pixel_area = NA, GL_med_size = NA, GL_mean_ecty = NA, GL_mean_FormF= NA, GL_mean_MajAxis= NA, GL_mean_MinAxis= NA) %>% rbind(incomplete_GL)

GL <- unordered_GL[with(unordered_GL, order(ImageNumber)),]


MT <- `MCZ_hiPSCs_CellP2D_05192022_MT.csv` %>% 
  select(ImageNumber, AreaShape_Area, AreaShape_Eccentricity, AreaShape_FormFactor, AreaShape_MajorAxisLength, AreaShape_MinorAxisLength) %>% 
  group_by(ImageNumber) %>% summarise(MT_pixel_area = sum(AreaShape_Area), MT_med_size = median(AreaShape_Area), MT_mean_ecty = mean(AreaShape_Eccentricity), MT_mean_FormF= mean(AreaShape_FormFactor), MT_mean_MajAxis= mean(AreaShape_MajorAxisLength), MT_mean_MinAxis= mean(AreaShape_MinorAxisLength))

# number_have_MT <- `MCZ_hiPSCs_CellP2D_05192022_MT.csv` %>%
#   select(ImageNumber, AreaShape_Area, ObjectNumber) %>% group_by(ImageNumber) %>% summarise()
# doesntMT <- subset(data.frame(ImageNumber = 1:38), !(ImageNumber %in% number_have_MT$ImageNumber))
# unordered_MT <- doesntMT %>% add_column(MT_total_area = NA, MT_median_size = NA, MT_mean_eccentricity = NA) %>% rbind(incomplete_MT)
# MT <- unordered_MT[with(unordered_MT, order(ImageNumber)),]


LS <- `MCZ_hiPSCs_CellP2D_05192022_LS.csv` %>% 
  select(ImageNumber, AreaShape_Area, AreaShape_Eccentricity, AreaShape_FormFactor, AreaShape_MajorAxisLength, AreaShape_MinorAxisLength, AreaShape_Compactness) %>% 
  group_by(ImageNumber) %>% summarise(LS_pixel_area = sum(AreaShape_Area), LS_med_size = median(AreaShape_Area), LS_mean_ecty = mean(AreaShape_Eccentricity), LS_mean_FormF= mean(AreaShape_FormFactor), LS_mean_MajAxis= mean(AreaShape_MajorAxisLength), LS_mean_MinAxis= mean(AreaShape_MinorAxisLength), LS_mean_Compact= mean(AreaShape_Compactness))

# number_have_LS <- `MCZ_hiPSCs_CellP2D_05192022_LS.csv` %>%
#   select(ImageNumber, AreaShape_Area, ObjectNumber) %>% group_by(ImageNumber) %>% summarise()
# doesntLS <- subset(data.frame(ImageNumber = 1:38), !(ImageNumber %in% number_have_LS$ImageNumber))
# unordered_LS <- doesntLS %>% add_column(LS_total_area = NA, LS_median_size = NA, LS_mean_eccentricity = NA) %>% rbind(incomplete_LS)
# LS <- unordered_LS[with(unordered_LS, order(ImageNumber)),]


#Selecting neighbor metrics from individual organelle files:
ER_neighbor <- `MCZ_hiPSCs_CellP2D_05192022_ER.csv` %>% 
  select(ImageNumber, Neighbors_PercentTouching_GL_Adjacent, Neighbors_PercentTouching_LS_Adjacent, Neighbors_PercentTouching_MT_Adjacent, Neighbors_PercentTouching_PO_Adjacent, Neighbors_PercentTouching_LD_Adjacent) %>% group_by(ImageNumber) %>%
  summarize(mean_perc_ER_bdry_GL = mean(Neighbors_PercentTouching_GL_Adjacent), 
            mean_perc_ER_bdry_PO = mean(Neighbors_PercentTouching_PO_Adjacent), 
            mean_perc_ER_bdry_MT = mean(Neighbors_PercentTouching_MT_Adjacent),
            mean_perc_ER_bdry_LD = mean(Neighbors_PercentTouching_LD_Adjacent),
            mean_perc_ER_bdry_LS = mean(Neighbors_PercentTouching_LS_Adjacent))

# unordered_ER_neighbor <- doesntER %>% add_column(mean_perc_ER_bdry_GL = NA, mean_perc_ER_bdry_PO = NA, mean_perc_ER_bdry_MT = NA, mean_perc_ER_bdry_LS = NA)%>% rbind(incomplete_ER_neighbor)
# ER_neighbor <- unordered_ER_neighbor[with(unordered_ER_neighbor, order(ImageNumber)),]

#Lysosomes neighbors
LS_neighbor <- `MCZ_hiPSCs_CellP2D_05192022_LS.csv` %>% 
  select(ImageNumber, Neighbors_PercentTouching_GL_Adjacent,	Neighbors_PercentTouching_ER_Adjacent,Neighbors_PercentTouching_LD_Adjacent, Neighbors_PercentTouching_MT_Adjacent, Neighbors_PercentTouching_PO_Adjacent) %>% group_by(ImageNumber) %>%
  summarize(mean_perc_LS_bdry_GL = mean(Neighbors_PercentTouching_GL_Adjacent), 
            mean_perc_LS_bdry_PO = mean(Neighbors_PercentTouching_PO_Adjacent),
            mean_perc_LS_bdry_MT = mean(Neighbors_PercentTouching_MT_Adjacent),
            mean_perc_PO_bdry_LD = mean(Neighbors_PercentTouching_LD_Adjacent),
            mean_perc_LS_bdry_ER = mean(Neighbors_PercentTouching_ER_Adjacent))

#Mitochondria neighbors
MT_neighbor <- `MCZ_hiPSCs_CellP2D_05192022_MT.csv` %>% 
  select(ImageNumber, Neighbors_PercentTouching_GL_Adjacent,	Neighbors_PercentTouching_ER_Adjacent, Neighbors_PercentTouching_LD_Adjacent, Neighbors_PercentTouching_LS_Adjacent, Neighbors_PercentTouching_PO_Adjacent) %>% group_by(ImageNumber) %>%
  summarize(mean_perc_MT_bdry_GL = mean(Neighbors_PercentTouching_GL_Adjacent), 
            mean_perc_MT_bdry_PO = mean(Neighbors_PercentTouching_PO_Adjacent),
            mean_perc_MT_bdry_LS = mean(Neighbors_PercentTouching_LS_Adjacent),
            mean_perc_PO_bdry_LD = mean(Neighbors_PercentTouching_LD_Adjacent),
            mean_perc_MT_bdry_ER = mean(Neighbors_PercentTouching_ER_Adjacent))

# unordered_MT_neighbor <- doesntMT %>% add_column(mean_perc_MT_bdry_GL = NA, mean_perc_MT_bdry_PO = NA, mean_perc_MT_bdry_LS = NA, mean_perc_MT_bdry_ER = NA)%>% rbind(incomplete_MT_neighbor)
# MT_neighbor <- unordered_MT_neighbor[with(unordered_MT_neighbor, order(ImageNumber)),]

#Golgi neighbors
GL_neighbor <- `MCZ_hiPSCs_CellP2D_05192022_GL.csv` %>% 
  select(ImageNumber, Neighbors_PercentTouching_LS_Adjacent,	Neighbors_PercentTouching_ER_Adjacent, Neighbors_PercentTouching_LD_Adjacent, Neighbors_PercentTouching_MT_Adjacent, Neighbors_PercentTouching_PO_Adjacent) %>% group_by(ImageNumber) %>%
  summarize(mean_perc_GL_bdry_LS = mean(Neighbors_PercentTouching_LS_Adjacent), 
            mean_perc_GL_bdry_PO = mean(Neighbors_PercentTouching_PO_Adjacent),
            mean_perc_GL_bdry_MT = mean(Neighbors_PercentTouching_MT_Adjacent),
            mean_perc_PO_bdry_LD = mean(Neighbors_PercentTouching_LD_Adjacent),
            mean_perc_GL_bdry_ER = mean(Neighbors_PercentTouching_ER_Adjacent))

# unordered_GL_neighbor <- doesntGL %>% add_column(mean_perc_GL_bdry_LS = NA, mean_perc_GL_bdry_PO = NA, mean_perc_GL_bdry_MT = NA, mean_perc_GL_bdry_ER = NA)%>% rbind(incomplete_GL_neighbor)
# GL_neighbor <- unordered_GL_neighbor[with(unordered_GL_neighbor, order(ImageNumber)),]


#Peroxisomes neighbors
PO_neighbor <- `MCZ_hiPSCs_CellP2D_05192022_PO.csv` %>% 
  select(ImageNumber, Neighbors_PercentTouching_GL_Adjacent,Neighbors_PercentTouching_ER_Adjacent, Neighbors_PercentTouching_LD_Adjacent, Neighbors_PercentTouching_MT_Adjacent, Neighbors_PercentTouching_LS_Adjacent) %>% group_by(ImageNumber) %>%
  summarize(mean_perc_PO_bdry_GL = mean(Neighbors_PercentTouching_GL_Adjacent), 
            mean_perc_PO_bdry_LS = mean(Neighbors_PercentTouching_LS_Adjacent),
            mean_perc_PO_bdry_MT = mean(Neighbors_PercentTouching_MT_Adjacent),
            mean_perc_PO_bdry_LD = mean(Neighbors_PercentTouching_LD_Adjacent),	
            mean_perc_PO_bdry_ER = mean(Neighbors_PercentTouching_ER_Adjacent))
# unordered_PO_neighbor <- doesntPO %>% add_column(mean_perc_PO_bdry_GL = NA, mean_perc_PO_bdry_LS = NA, mean_perc_PO_bdry_MT = NA, mean_perc_PO_bdry_ER = NA)%>% rbind(incomplete_PO_neighbor)
# PO_neighbor <- unordered_PO_neighbor[with(unordered_PO_neighbor, order(ImageNumber)),]


#Lysosomes Proximity (FirstDistance and SecondDistance)
LS_Proximity <- `MCZ_hiPSCs_CellP2D_05192022_LS.csv` %>% 
  select(ImageNumber, Neighbors_FirstClosestDistance_ER_Adjacent, Neighbors_FirstClosestDistance_GL_Adjacent, Neighbors_FirstClosestDistance_MT_Adjacent, Neighbors_FirstClosestDistance_LD_Adjacent, Neighbors_FirstClosestDistance_PO_Adjacent) %>% group_by(ImageNumber) %>%
  summarize(mean_perc_LS_Prox_ER= mean(Neighbors_FirstClosestDistance_ER_Adjacent),
            mean_perc_LS_Prox_MT= mean(Neighbors_FirstClosestDistance_MT_Adjacent),
            mean_perc_LS_Prox_PO= mean(Neighbors_FirstClosestDistance_PO_Adjacent),
            mean_perc_LS_Prox_GL= mean(Neighbors_FirstClosestDistance_GL_Adjacent),
            mean_perc_LS_Prox_LD= mean(Neighbors_FirstClosestDistance_LD_Adjacent))

#Mitochondria Proximity (FirstDistance and SecondDistance)
MT_Proximity <- `MCZ_hiPSCs_CellP2D_05192022_MT.csv` %>% 
  select(ImageNumber, Neighbors_FirstClosestDistance_ER_Adjacent, Neighbors_FirstClosestDistance_GL_Adjacent, Neighbors_FirstClosestDistance_LS_Adjacent, Neighbors_FirstClosestDistance_LD_Adjacent, Neighbors_FirstClosestDistance_PO_Adjacent) %>% group_by(ImageNumber) %>%
  summarize(mean_perc_MT_Prox_ER= mean(Neighbors_FirstClosestDistance_ER_Adjacent),
            mean_perc_MT_Prox_LS= mean(Neighbors_FirstClosestDistance_LS_Adjacent),
            mean_perc_MT_Prox_PO= mean(Neighbors_FirstClosestDistance_PO_Adjacent),
            mean_perc_MT_Prox_GL= mean(Neighbors_FirstClosestDistance_GL_Adjacent),
            mean_perc_MT_Prox_LD= mean(Neighbors_FirstClosestDistance_LD_Adjacent))

#Golgi Proximity (FirstDistance and SecondDistance)
GL_Proximity <- `MCZ_hiPSCs_CellP2D_05192022_GL.csv` %>% 
  select(ImageNumber, Neighbors_FirstClosestDistance_ER_Adjacent, Neighbors_FirstClosestDistance_MT_Adjacent, Neighbors_FirstClosestDistance_LS_Adjacent, Neighbors_FirstClosestDistance_LD_Adjacent, Neighbors_FirstClosestDistance_PO_Adjacent) %>% group_by(ImageNumber) %>%
  summarize(mean_perc_GL_Prox_ER= mean(Neighbors_FirstClosestDistance_ER_Adjacent),
            mean_perc_GL_Prox_LS= mean(Neighbors_FirstClosestDistance_LS_Adjacent),
            mean_perc_GL_Prox_PO= mean(Neighbors_FirstClosestDistance_PO_Adjacent),
            mean_perc_GL_Prox_MT= mean(Neighbors_FirstClosestDistance_MT_Adjacent),
            mean_perc_GL_Prox_LD= mean(Neighbors_FirstClosestDistance_LD_Adjacent))

#Peroxisomes Proximity (FirstDistance and SecondDistance)
PO_Proximity <- `MCZ_hiPSCs_CellP2D_05192022_PO.csv` %>% 
  select(ImageNumber, Neighbors_FirstClosestDistance_ER_Adjacent, Neighbors_FirstClosestDistance_MT_Adjacent, Neighbors_FirstClosestDistance_LS_Adjacent, Neighbors_FirstClosestDistance_LD_Adjacent, Neighbors_FirstClosestDistance_GL_Adjacent) %>% group_by(ImageNumber) %>%
  summarize(mean_perc_PO_Prox_ER= mean(Neighbors_FirstClosestDistance_ER_Adjacent),
            mean_perc_PO_Prox_LS= mean(Neighbors_FirstClosestDistance_LS_Adjacent),
            mean_perc_PO_Prox_GL= mean(Neighbors_FirstClosestDistance_GL_Adjacent),
            mean_perc_PO_Prox_MT= mean(Neighbors_FirstClosestDistance_MT_Adjacent),
            mean_perc_PO_Prox_LD= mean(Neighbors_FirstClosestDistance_LD_Adjacent))

#ER Proximity (FirstDistance and SecondDistance)
ER_Proximity <- `MCZ_hiPSCs_CellP2D_05192022_ER.csv` %>% 
  select(ImageNumber, Neighbors_FirstClosestDistance_GL_Adjacent, Neighbors_FirstClosestDistance_MT_Adjacent, Neighbors_FirstClosestDistance_LS_Adjacent, Neighbors_FirstClosestDistance_LD_Adjacent, Neighbors_FirstClosestDistance_PO_Adjacent) %>% group_by(ImageNumber) %>%
  summarize(mean_perc_ER_Prox_GL= mean(Neighbors_FirstClosestDistance_GL_Adjacent),
            mean_perc_ER_Prox_LS= mean(Neighbors_FirstClosestDistance_LS_Adjacent),
            mean_perc_ER_Prox_PO= mean(Neighbors_FirstClosestDistance_PO_Adjacent),
            mean_perc_ER_Prox_MT= mean(Neighbors_FirstClosestDistance_MT_Adjacent),
            mean_perc_ER_Prox_LD= mean(Neighbors_FirstClosestDistance_LD_Adjacent))

#LD Proximity (FirstDistance and SecondDistance)
#LD_Proximity <- `MCZ_hiPSCs_CellP2D_05192022_LD.csv` %>% 
#select(ImageNumber, Neighbors_FirstClosestDistance_ER_Adjacent, Neighbors_FirstClosestDistance_MT_Adjacent, Neighbors_FirstClosestDistance_LS_Adjacent, Neighbors_FirstClosestDistance_GL_Adjacent, Neighbors_FirstClosestDistance_PO_Adjacent) %>% group_by(ImageNumber) %>%
#summarize(mean_perc_LD_Prox_ER= mean(Neighbors_FirstClosestDistance_ER_Adjacent),
## mean_perc_LD_Prox_LS= mean(Neighbors_FirstClosestDistance_LS_Adjacent),
# mean_perc_LD_Prox_PO= mean(Neighbors_FirstClosestDistance_PO_Adjacent),
# mean_perc_LD_Prox_MT= mean(Neighbors_FirstClosestDistance_MT_Adjacent),
# mean_perc_LD_Prox_GL= mean(Neighbors_FirstClosestDistance_GL_Adjacent))


# unordered_LS_neighbor <- doesntLS %>% add_column(mean_perc_LS_bdry_GL = NA, mean_perc_LS_bdry_PO = NA, mean_perc_LS_bdry_MT = NA, mean_perc_LS_bdry_ER = NA)%>% rbind(incomplete_LS_neighbor)
# LS_neighbor <- unordered_LS_neighbor[with(unordered_LS_neighbor, order(ImageNumber)),]

#Selecting metadata and additional data (cell and organelle size, organelle counts, and contact overlap metrics) from Image file:
#image_meta <- `MCZ_hiPSCs_CellP2D_05192022_Image.csv` %>% 
#  select(Metadata_SampleName,	Metadata_Day, ImageNumber)	
area_counts <- `MCZ_hiPSCs_CellP2D_05192022_Image.csv` %>% summarize(ImageNumber = ImageNumber, CY_pixel_area = AreaOccupied_AreaOccupied_CY, SO_pixel_area = AreaOccupied_AreaOccupied_SO, NU_pixel_area = AreaOccupied_AreaOccupied_NU, GL_count = Count_GL, LS_count = Count_LS, PO_count = Count_PO, MT_count = Count_MT, LD_count = Count_LD)

meta <- `MCZ_hiPSCs_CellP2D_05192022_Image.csv` %>% 
  summarise(ImageNumber = ImageNumber, group = Metadata_SampleName, ImageName = FileName_SomaGreyScale)

organelle_overlap <- `MCZ_hiPSCs_CellP2D_05192022_Image.csv` %>%
summarise(ImageNumber = ImageNumber, pixel_area_GL_ER = AreaOccupied_AreaOccupied_GL_ER, pixel_area_LS_ER = AreaOccupied_AreaOccupied_LS_ER, pixel_area_MT_ER = AreaOccupied_AreaOccupied_MT_ER, pixel_area_PO_ER = AreaOccupied_AreaOccupied_PO_ER, pixel_area_PO_LD = AreaOccupied_AreaOccupied_PO_LD, pixel_area_LS_GL = AreaOccupied_AreaOccupied_LS_GL, pixel_area_LS_LD = AreaOccupied_AreaOccupied_LS_LD, pixel_area_MT_GL = AreaOccupied_AreaOccupied_MT_GL, pixel_area_MT_LD = AreaOccupied_AreaOccupied_MT_LD, pixel_area_GL_PO = AreaOccupied_AreaOccupied_GL_PO, pixel_area_LS_MT = AreaOccupied_AreaOccupied_LS_MT, pixel_area_LS_PO = AreaOccupied_AreaOccupied_LS_PO, pixel_area_MT_PO = AreaOccupied_AreaOccupied_MT_PO, pixel_area_ER_LD = AreaOccupied_AreaOccupied_ER_LD, Count_GL_ER = Count_GL_ER, Count_LS_ER = Count_LS_ER, Count_MT_ER = Count_MT_ER, Count_PO_ER = Count_PO_ER, Count_LS_GL = Count_LS_GL, Count_MT_GL = Count_MT_GL, Count_GL_PO = Count_GL_PO, Count_LS_MT = Count_LS_MT, Count_LS_PO = Count_LS_PO, Count_MT_PO = Count_MT_PO, Count_MT_LD = Count_MT_LD, Count_LS_LD = Count_LS_LD, Count_PO_LD = Count_PO_LD,  Count_ER_LD = Count_ER_LD)

#Distribution organelle grouped into Peri-Nuclear, Periphery, Peri-Plasmamembrane:
SO <- `MCZ_hiPSCs_CellP2D_05192022_SO.csv` %>% summarise(ImageNumber = ImageNumber, SO_ecty = AreaShape_Eccentricity)

#Distribution Organelle raw:
Distribution_DataRaw <- `MCZ_hiPSCs_CellP2D_05192022_SO.csv` %>% 
  summarise(ER_FAD_bin_1 = RadialDistribution_FracAtD_ER_conv_1of9, ER_FAD_bin_2 = RadialDistribution_FracAtD_ER_conv_2of9,
            ER_FAD_bin_3 = RadialDistribution_FracAtD_ER_conv_3of9, ER_FAD_bin_4 = RadialDistribution_FracAtD_ER_conv_4of9,
            ER_FAD_bin_5 = RadialDistribution_FracAtD_ER_conv_5of9, ER_FAD_bin_6 = RadialDistribution_FracAtD_ER_conv_6of9,
            ER_FAD_bin_7 = RadialDistribution_FracAtD_ER_conv_7of9, ER_FAD_bin_8 = RadialDistribution_FracAtD_ER_conv_8of9,
            ER_FAD_bin_9 = RadialDistribution_FracAtD_ER_conv_9of9, GL_FAD_bin_1 = RadialDistribution_FracAtD_GL_conv_1of9,
            GL_FAD_bin_2 = RadialDistribution_FracAtD_GL_conv_2of9, GL_FAD_bin_3 = RadialDistribution_FracAtD_GL_conv_3of9,
            GL_FAD_bin_4 = RadialDistribution_FracAtD_GL_conv_4of9, GL_FAD_bin_5 = RadialDistribution_FracAtD_GL_conv_5of9,
            GL_FAD_bin_6 = RadialDistribution_FracAtD_GL_conv_6of9, GL_FAD_bin_7 = RadialDistribution_FracAtD_GL_conv_7of9,
            GL_FAD_bin_8 = RadialDistribution_FracAtD_GL_conv_8of9, GL_FAD_bin_9 = RadialDistribution_FracAtD_GL_conv_9of9,
            LS_FAD_bin_1 = RadialDistribution_FracAtD_LS_conv_1of9, LS_FAD_bin_2 = RadialDistribution_FracAtD_LS_conv_2of9,
            LS_FAD_bin_3 = RadialDistribution_FracAtD_LS_conv_3of9, LS_FAD_bin_4 = RadialDistribution_FracAtD_LS_conv_4of9,
            LS_FAD_bin_5 = RadialDistribution_FracAtD_LS_conv_5of9, LS_FAD_bin_6 = RadialDistribution_FracAtD_LS_conv_6of9,
            LS_FAD_bin_7 = RadialDistribution_FracAtD_LS_conv_7of9, LS_FAD_bin_8 = RadialDistribution_FracAtD_LS_conv_8of9,
            LS_FAD_bin_9 = RadialDistribution_FracAtD_LS_conv_9of9, MT_FAD_bin_1 = RadialDistribution_FracAtD_MT_conv_1of9,
            MT_FAD_bin_2 = RadialDistribution_FracAtD_MT_conv_2of9, MT_FAD_bin_3 = RadialDistribution_FracAtD_MT_conv_3of9,
            MT_FAD_bin_4 = RadialDistribution_FracAtD_MT_conv_4of9, MT_FAD_bin_5 = RadialDistribution_FracAtD_MT_conv_5of9,
            MT_FAD_bin_6 = RadialDistribution_FracAtD_MT_conv_6of9, MT_FAD_bin_7 = RadialDistribution_FracAtD_MT_conv_7of9,
            MT_FAD_bin_8 = RadialDistribution_FracAtD_MT_conv_8of9, MT_FAD_bin_9 = RadialDistribution_FracAtD_MT_conv_9of9,
            PO_FAD_bin_1 = RadialDistribution_FracAtD_PO_conv_1of9, PO_FAD_bin_2 = RadialDistribution_FracAtD_PO_conv_2of9,
            PO_FAD_bin_3 = RadialDistribution_FracAtD_PO_conv_3of9, PO_FAD_bin_4 = RadialDistribution_FracAtD_PO_conv_4of9,
            PO_FAD_bin_5 = RadialDistribution_FracAtD_PO_conv_5of9, PO_FAD_bin_6 = RadialDistribution_FracAtD_PO_conv_6of9,
            PO_FAD_bin_7 = RadialDistribution_FracAtD_PO_conv_7of9, PO_FAD_bin_8 = RadialDistribution_FracAtD_PO_conv_8of9,
            PO_FAD_bin_9 = RadialDistribution_FracAtD_PO_conv_9of9,
            LD_FAD_bin_1 = RadialDistribution_FracAtD_LD_conv_1of9, LD_FAD_bin_2 = RadialDistribution_FracAtD_LD_conv_2of9,
            LD_FAD_bin_3 = RadialDistribution_FracAtD_LD_conv_3of9, LD_FAD_bin_4 = RadialDistribution_FracAtD_LD_conv_4of9,
            LD_FAD_bin_5 = RadialDistribution_FracAtD_LD_conv_5of9, LD_FAD_bin_6 = RadialDistribution_FracAtD_LD_conv_6of9,
            LD_FAD_bin_7 = RadialDistribution_FracAtD_LD_conv_7of9, LD_FAD_bin_8 = RadialDistribution_FracAtD_LD_conv_8of9,
            LD_FAD_bin_9 = RadialDistribution_FracAtD_LD_conv_9of9)

 

Distribution_contacts_DataRaw <- `MCZ_hiPSCs_CellP2D_05192022_SO.csv` %>% 
  summarise (LS_ER_FAD_bin_1=RadialDistribution_FracAtD_LS_ER_conv_1of9,
LS_ER_FAD_bin_2=RadialDistribution_FracAtD_LS_ER_conv_2of9,
LS_ER_FAD_bin_3=RadialDistribution_FracAtD_LS_ER_conv_3of9,
LS_ER_FAD_bin_4=RadialDistribution_FracAtD_LS_ER_conv_4of9,
LS_ER_FAD_bin_5=RadialDistribution_FracAtD_LS_ER_conv_5of9,
LS_ER_FAD_bin_6=RadialDistribution_FracAtD_LS_ER_conv_6of9,
LS_ER_FAD_bin_7=RadialDistribution_FracAtD_LS_ER_conv_7of9,
LS_ER_FAD_bin_8=RadialDistribution_FracAtD_LS_ER_conv_8of9,
LS_ER_FAD_bin_9=RadialDistribution_FracAtD_LS_ER_conv_9of9,
LS_LD_FAD_bin_2=RadialDistribution_FracAtD_LS_ER_conv_2of9,
LS_LD_FAD_bin_3=RadialDistribution_FracAtD_LS_ER_conv_3of9,
LS_LD_FAD_bin_4=RadialDistribution_FracAtD_LS_ER_conv_4of9,
LS_LD_FAD_bin_5=RadialDistribution_FracAtD_LS_ER_conv_5of9,
LS_LD_FAD_bin_6=RadialDistribution_FracAtD_LS_ER_conv_6of9,
LS_LD_FAD_bin_7=RadialDistribution_FracAtD_LS_ER_conv_7of9,
LS_LD_FAD_bin_8=RadialDistribution_FracAtD_LS_ER_conv_8of9,
LS_LD_FAD_bin_9=RadialDistribution_FracAtD_LS_ER_conv_9of9,
LS_GL_bin_1=RadialDistribution_FracAtD_LS_GL_conv_1of9,
LS_GL_bin_2=RadialDistribution_FracAtD_LS_GL_conv_2of9,
LS_GL_bin_3=RadialDistribution_FracAtD_LS_GL_conv_3of9,
LS_GL_bin_4=RadialDistribution_FracAtD_LS_GL_conv_4of9,
LS_GL_bin_5=RadialDistribution_FracAtD_LS_GL_conv_5of9,
LS_GL_bin_6=RadialDistribution_FracAtD_LS_GL_conv_6of9,
LS_GL_bin_7=RadialDistribution_FracAtD_LS_GL_conv_7of9,
LS_GL_bin_8=RadialDistribution_FracAtD_LS_GL_conv_8of9,
LS_GL_bin_9=RadialDistribution_FracAtD_LS_GL_conv_9of9,
LS_MT_bin_1=RadialDistribution_FracAtD_LS_MT_conv_1of9,
LS_MT_bin_2=RadialDistribution_FracAtD_LS_MT_conv_2of9,
LS_MT_bin_3=RadialDistribution_FracAtD_LS_MT_conv_3of9,
LS_MT_bin_4=RadialDistribution_FracAtD_LS_MT_conv_4of9,
LS_MT_bin_5=RadialDistribution_FracAtD_LS_MT_conv_5of9,
LS_MT_bin_6=RadialDistribution_FracAtD_LS_MT_conv_6of9,
LS_MT_bin_7=RadialDistribution_FracAtD_LS_MT_conv_7of9,
LS_MT_bin_8=RadialDistribution_FracAtD_LS_MT_conv_8of9,
LS_MT_bin_9=RadialDistribution_FracAtD_LS_MT_conv_9of9,
LS_PO_bin_1=RadialDistribution_FracAtD_LS_PO_conv_1of9,
LS_PO_bin_2=RadialDistribution_FracAtD_LS_PO_conv_2of9,
LS_PO_bin_3=RadialDistribution_FracAtD_LS_PO_conv_3of9,
LS_PO_bin_4=RadialDistribution_FracAtD_LS_PO_conv_4of9,
LS_PO_bin_5=RadialDistribution_FracAtD_LS_PO_conv_5of9,
LS_PO_bin_6=RadialDistribution_FracAtD_LS_PO_conv_6of9,
LS_PO_bin_7=RadialDistribution_FracAtD_LS_PO_conv_7of9,
LS_PO_bin_8=RadialDistribution_FracAtD_LS_PO_conv_8of9,
LS_PO_bin_9=RadialDistribution_FracAtD_LS_PO_conv_9of9,
MT_ER_bin_1=RadialDistribution_FracAtD_MT_ER_conv_1of9,
MT_ER_bin_2=RadialDistribution_FracAtD_MT_ER_conv_2of9,
MT_ER_bin_3=RadialDistribution_FracAtD_MT_ER_conv_3of9,
MT_ER_bin_4=RadialDistribution_FracAtD_MT_ER_conv_4of9,
MT_ER_bin_5=RadialDistribution_FracAtD_MT_ER_conv_5of9,
MT_ER_bin_6=RadialDistribution_FracAtD_MT_ER_conv_6of9,
MT_ER_bin_7=RadialDistribution_FracAtD_MT_ER_conv_7of9,
MT_ER_bin_8=RadialDistribution_FracAtD_MT_ER_conv_8of9,
MT_LD_bin_1=RadialDistribution_FracAtD_MT_ER_conv_1of9,
MT_LD_bin_2=RadialDistribution_FracAtD_MT_ER_conv_2of9,
MT_LD_bin_3=RadialDistribution_FracAtD_MT_ER_conv_3of9,
MT_LD_bin_4=RadialDistribution_FracAtD_MT_ER_conv_4of9,
MT_LD_bin_5=RadialDistribution_FracAtD_MT_ER_conv_5of9,
MT_LD_bin_6=RadialDistribution_FracAtD_MT_ER_conv_6of9,
MT_LD_bin_7=RadialDistribution_FracAtD_MT_ER_conv_7of9,
MT_LD_bin_8=RadialDistribution_FracAtD_MT_ER_conv_8of9,
MT_LD_bin_9=RadialDistribution_FracAtD_MT_ER_conv_9of9,
MT_GL_bin_1=RadialDistribution_FracAtD_MT_GL_conv_1of9,
MT_GL_bin_2=RadialDistribution_FracAtD_MT_GL_conv_2of9,
MT_GL_bin_3=RadialDistribution_FracAtD_MT_GL_conv_3of9,
MT_GL_bin_4=RadialDistribution_FracAtD_MT_GL_conv_4of9,
MT_GL_bin_5=RadialDistribution_FracAtD_MT_GL_conv_5of9,
MT_GL_bin_6=RadialDistribution_FracAtD_MT_GL_conv_6of9,
MT_GL_bin_7=RadialDistribution_FracAtD_MT_GL_conv_7of9,
MT_GL_bin_8=RadialDistribution_FracAtD_MT_GL_conv_8of9,
MT_GL_bin_9=RadialDistribution_FracAtD_MT_GL_conv_9of9,
MT_PO_bin_1=RadialDistribution_FracAtD_MT_PO_conv_1of9,
MT_PO_bin_2=RadialDistribution_FracAtD_MT_PO_conv_2of9,
MT_PO_bin_3=RadialDistribution_FracAtD_MT_PO_conv_3of9,
MT_PO_bin_4=RadialDistribution_FracAtD_MT_PO_conv_4of9,
MT_PO_bin_5=RadialDistribution_FracAtD_MT_PO_conv_5of9,
MT_PO_bin_6=RadialDistribution_FracAtD_MT_PO_conv_6of9,
MT_PO_bin_7=RadialDistribution_FracAtD_MT_PO_conv_7of9,
MT_PO_bin_8=RadialDistribution_FracAtD_MT_PO_conv_8of9,
MT_PO_bin_9=RadialDistribution_FracAtD_MT_PO_conv_9of9,
PO_ER_bin_1=RadialDistribution_FracAtD_PO_ER_conv_1of9,
PO_ER_bin_2=RadialDistribution_FracAtD_PO_ER_conv_2of9,
PO_ER_bin_3=RadialDistribution_FracAtD_PO_ER_conv_3of9,
PO_ER_bin_4=RadialDistribution_FracAtD_PO_ER_conv_4of9,
PO_ER_bin_5=RadialDistribution_FracAtD_PO_ER_conv_5of9,
PO_ER_bin_6=RadialDistribution_FracAtD_PO_ER_conv_6of9,
PO_ER_bin_7=RadialDistribution_FracAtD_PO_ER_conv_7of9,
PO_ER_bin_8=RadialDistribution_FracAtD_PO_ER_conv_8of9,
PO_ER_bin_9=RadialDistribution_FracAtD_PO_ER_conv_9of9,
PO_LD_bin_1=RadialDistribution_FracAtD_PO_ER_conv_1of9,
PO_LD_bin_2=RadialDistribution_FracAtD_PO_ER_conv_2of9,
PO_LD_bin_3=RadialDistribution_FracAtD_PO_ER_conv_3of9,
PO_LD_bin_4=RadialDistribution_FracAtD_PO_ER_conv_4of9,
PO_LD_bin_5=RadialDistribution_FracAtD_PO_ER_conv_5of9,
PO_LD_bin_6=RadialDistribution_FracAtD_PO_ER_conv_6of9,
PO_LD_bin_7=RadialDistribution_FracAtD_PO_ER_conv_7of9,
PO_LD_bin_8=RadialDistribution_FracAtD_PO_ER_conv_8of9,
PO_LD_bin_9=RadialDistribution_FracAtD_PO_ER_conv_9of9,
GL_LD_bin_1=RadialDistribution_FracAtD_PO_ER_conv_1of9,
GL_LD_bin_2=RadialDistribution_FracAtD_PO_ER_conv_2of9,
GL_LD_bin_3=RadialDistribution_FracAtD_PO_ER_conv_3of9,
GL_LD_bin_4=RadialDistribution_FracAtD_PO_ER_conv_4of9,
GL_LD_bin_5=RadialDistribution_FracAtD_PO_ER_conv_5of9,
GL_LD_bin_6=RadialDistribution_FracAtD_PO_ER_conv_6of9,
GL_LD_bin_7=RadialDistribution_FracAtD_PO_ER_conv_7of9,
GL_LD_bin_8=RadialDistribution_FracAtD_PO_ER_conv_8of9,
GL_LD_bin_9=RadialDistribution_FracAtD_PO_ER_conv_9of9)

organelle_data <- cbind(meta, area_counts, ER, PO, GL, MT, LS, LD, SO) %>% subset(select = which(!duplicated(names(.)))) %>%
  mutate(CY_SO_perc_area = (CY_pixel_area/SO_pixel_area)*100, 
         ER_SO_perc_area = (ER_pixel_area/SO_pixel_area)*100,
         PO_SO_perc_area = (PO_pixel_area/SO_pixel_area)*100, 
         MT_SO_perc_area = (MT_pixel_area/SO_pixel_area)*100, 
         LS_SO_perc_area = (LS_pixel_area/SO_pixel_area)*100,
         GL_SO_perc_area = (GL_pixel_area/SO_pixel_area)*100, 
         ER_CY_perc_area = (ER_pixel_area/CY_pixel_area)*100,
         PO_CY_perc_area = (PO_pixel_area/SO_pixel_area)*100, 
         MT_CY_perc_area = (MT_pixel_area/CY_pixel_area)*100,
         LS_CY_perc_area = (LS_pixel_area/CY_pixel_area)*100, 
         GL_CY_perc_area = (GL_pixel_area/CY_pixel_area)*100,
         LD_CY_perc_area = (LD_pixel_area/CY_pixel_area)*100) %>%
  select(group, ImageNumber, SO_pixel_area, SO_ecty, CY_pixel_area, NU_pixel_area, CY_SO_perc_area, 
         LS_count, LS_pixel_area, LS_CY_perc_area, LS_med_size,	LS_mean_ecty, LS_mean_FormF, LS_mean_MajAxis, LS_mean_MinAxis, LS_mean_Compact,
         MT_count, MT_pixel_area, MT_CY_perc_area, MT_med_size,	MT_mean_ecty, MT_mean_FormF, MT_mean_MajAxis, MT_mean_MinAxis,
         GL_count, GL_pixel_area, GL_CY_perc_area, GL_med_size,	GL_mean_ecty, GL_mean_FormF, GL_mean_MajAxis, GL_mean_MinAxis,
         PO_count, PO_pixel_area, PO_CY_perc_area, PO_med_size,	PO_mean_ecty, PO_mean_FormF, PO_mean_MajAxis, PO_mean_MinAxis,
         ER_pixel_area, ER_CY_perc_area, ER_mean_ecty,
         LD_count, LD_pixel_area, LD_CY_perc_area, LD_med_size, LD_mean_ecty, LD_mean_FormF, LD_mean_MajAxis, LD_mean_MinAxis)

#organelle_LD_data <- cbind(meta, area_counts, LD) %>% subset(select = which(!duplicated(names(.)))) %>%
  #mutate(LD_CY_perc_area = (LD_pixel_area/CY_pixel_area)*100) %>%
  #select(group, ImageNumber, LD_count, LD_pixel_area, LD_CY_perc_area, LD_med_size, LD_mean_ecty)

ContactsFraction_data <- cbind(meta, ER, PO, GL, MT, LS, LD, organelle_overlap, PO_neighbor, LS_neighbor, MT_neighbor, ER_neighbor, GL_neighbor) %>% subset(select = which(!duplicated(names(.)))) %>%
  mutate(perc_ER_ovlp_PO = (pixel_area_PO_ER/ER_pixel_area)*100,
         perc_ER_ovlp_GL = (pixel_area_GL_ER/ER_pixel_area)*100, 
         perc_ER_ovlp_MT = (pixel_area_MT_ER/ER_pixel_area)*100, 
         perc_ER_ovlp_LS = (pixel_area_LS_ER/ER_pixel_area)*100,
         perc_PO_ovlp_ER = (pixel_area_PO_ER/PO_pixel_area)*100,
         perc_PO_ovlp_GL = (pixel_area_GL_PO/PO_pixel_area)*100,
         perc_PO_ovlp_MT = (pixel_area_MT_PO/PO_pixel_area)*100,
         perc_PO_ovlp_LS = (pixel_area_LS_PO/PO_pixel_area)*100,
         perc_GL_ovlp_ER = (pixel_area_GL_ER/GL_pixel_area)*100,
         perc_GL_ovlp_PO = (pixel_area_GL_PO/GL_pixel_area)*100,
         perc_GL_ovlp_MT = (pixel_area_MT_GL/GL_pixel_area)*100,
         perc_GL_ovlp_LS = (pixel_area_LS_GL/GL_pixel_area)*100,
         perc_MT_ovlp_ER = (pixel_area_MT_ER/MT_pixel_area)*100, 
         perc_MT_ovlp_PO = (pixel_area_MT_PO/MT_pixel_area)*100,
         perc_MT_ovlp_GL = (pixel_area_MT_GL/MT_pixel_area)*100,
         perc_MT_ovlp_LS = (pixel_area_LS_MT/MT_pixel_area)*100,
         perc_LS_ovlp_ER = (pixel_area_LS_ER/LS_pixel_area)*100, 
         perc_LS_ovlp_PO = (pixel_area_LS_PO/LS_pixel_area)*100,
         perc_LS_ovlp_GL = (pixel_area_LS_GL/LS_pixel_area)*100,
         perc_LS_ovlp_MT = (pixel_area_LS_MT/LS_pixel_area)*100) %>% 
  select(group, ImageNumber,
         pixel_area_LS_MT, perc_LS_ovlp_MT, perc_MT_ovlp_LS, mean_perc_LS_bdry_MT, mean_perc_LS_bdry_MT,
         pixel_area_LS_GL, perc_LS_ovlp_GL, perc_GL_ovlp_LS, mean_perc_LS_bdry_GL, mean_perc_GL_bdry_LS,
         pixel_area_LS_PO, perc_LS_ovlp_PO, perc_PO_ovlp_LS, mean_perc_LS_bdry_PO, mean_perc_PO_bdry_LS,
         pixel_area_LS_ER, perc_LS_ovlp_ER, perc_ER_ovlp_LS, mean_perc_LS_bdry_ER, mean_perc_ER_bdry_LS,
         pixel_area_MT_GL, perc_MT_ovlp_GL, perc_GL_ovlp_MT, mean_perc_MT_bdry_GL, mean_perc_GL_bdry_MT,
         pixel_area_MT_PO, perc_MT_ovlp_PO, perc_PO_ovlp_MT, mean_perc_MT_bdry_PO, mean_perc_PO_bdry_MT,
         pixel_area_MT_ER, perc_MT_ovlp_ER, perc_ER_ovlp_MT, mean_perc_MT_bdry_ER, mean_perc_ER_bdry_MT,
         pixel_area_GL_PO, perc_GL_ovlp_PO, perc_PO_ovlp_GL, mean_perc_GL_bdry_PO, mean_perc_PO_bdry_GL,
         pixel_area_GL_ER, perc_GL_ovlp_ER, perc_ER_ovlp_GL, mean_perc_GL_bdry_ER, mean_perc_ER_bdry_GL,
         pixel_area_PO_ER, perc_PO_ovlp_ER, perc_ER_ovlp_PO, mean_perc_PO_bdry_ER, mean_perc_ER_bdry_PO)

contacts_data_NormSOandCY <- cbind(meta, area_counts, ER, PO, GL, MT, LS, LD, SO, organelle_overlap,PO_neighbor, LS_neighbor, MT_neighbor, ER_neighbor, GL_neighbor) %>% subset(select = which(!duplicated(names(.)))) %>%
  mutate(
         LS_ER_CY_perc_area = (pixel_area_LS_ER/CY_pixel_area)*100,
         LS_GL_CY_perc_area = (pixel_area_LS_GL/CY_pixel_area)*100,
         LS_MT_CY_perc_area = (pixel_area_LS_MT/CY_pixel_area)*100,
         LS_PO_CY_perc_area = (pixel_area_LS_PO/CY_pixel_area)*100,
         MT_ER_CY_perc_area = (pixel_area_MT_ER/CY_pixel_area)*100,
         MT_GL_CY_perc_area = (pixel_area_MT_GL/CY_pixel_area)*100,
         MT_PO_CY_perc_area = (pixel_area_MT_PO/CY_pixel_area)*100,
         PO_ER_CY_perc_area = (pixel_area_PO_ER/CY_pixel_area)*100,
         LS_LD_CY_perc_area = (pixel_area_LS_LD/CY_pixel_area)*100,
         MT_LD_CY_perc_area = (pixel_area_MT_LD/CY_pixel_area)*100,
         PO_LD_CY_perc_area = (pixel_area_PO_LD/CY_pixel_area)*100,
         ER_LD_CY_perc_area = (pixel_area_ER_LD/CY_pixel_area)*100) %>%
  
  select(group, ImageNumber, 
         LS_LD_CY_perc_area, LS_GL_CY_perc_area, LS_MT_CY_perc_area, LS_PO_CY_perc_area, LS_ER_CY_perc_area, 
         MT_LD_CY_perc_area, MT_ER_CY_perc_area, MT_GL_CY_perc_area, MT_PO_CY_perc_area,
         PO_LD_CY_perc_area, PO_ER_CY_perc_area, ER_LD_CY_perc_area)

Proximity_organelle_data <- cbind (LS_Proximity, MT_Proximity, GL_Proximity, PO_Proximity, ER_Proximity)%>% subset(select = which(!duplicated(names(.)))) %>%
  select(ImageNumber,
         mean_perc_LS_Prox_ER, mean_perc_LS_Prox_MT, mean_perc_LS_Prox_PO, mean_perc_LS_Prox_GL, mean_perc_LS_Prox_LD,
         mean_perc_MT_Prox_ER, mean_perc_MT_Prox_LS, mean_perc_MT_Prox_PO, mean_perc_MT_Prox_GL, mean_perc_MT_Prox_LD,
         mean_perc_GL_Prox_ER, mean_perc_GL_Prox_LS, mean_perc_GL_Prox_PO, mean_perc_GL_Prox_MT, mean_perc_GL_Prox_LD,
         mean_perc_PO_Prox_ER, mean_perc_PO_Prox_LS, mean_perc_PO_Prox_GL, mean_perc_PO_Prox_MT, mean_perc_PO_Prox_LD,
         mean_perc_ER_Prox_GL, mean_perc_ER_Prox_LS, mean_perc_ER_Prox_PO, mean_perc_ER_Prox_MT, mean_perc_ER_Prox_LD)

library(dplyr)

#zscores
#numeric_organelle <- select_if(organelle_data, is.numeric) %>% select(-ImageNumber)
#numeric_neighbor <- select_if(ContactsFraction_data, is.numeric) %>% select(-ImageNumber)
#organelle_zscores <- scale(numeric_organelle) %>% cbind(meta)
#neighbor_zscores <- scale(numeric_neighbor) %>% cbind(meta)


#export the files
dir.create(file.path('MCZ_05162022_cleandata'))
write.csv(organelle_data, "./MCZ_05162022_cleandata/organelle_data_MCZ_05162022.csv", row.names = FALSE)
write.csv(ContactsFraction_data, "./MCZ_05162022_cleandata/ContactsFraction_data_MCZ_05162022.csv", row.names = FALSE)
#write.csv(organelle_zscores, "./MCZ_05162022_cleandata/organelle_zscores_MCZ_05162022.csv", row.names = FALSE)
#write.csv(neighbor_zscores, "./MCZ_05162022_cleandata/neighbor_zscores_MCZ_05162022.csv", row.names = FALSE)
write.csv(Distribution_DataRaw, "./MCZ_05162022_cleandata/Distribution_DataRaw_MCZ_05162022.csv", row.names = FALSE)
write.csv(Distribution_contacts_DataRaw, "./MCZ_05162022_cleandata/Distribution_contacts_DataRaw_MCZ_05162022.csv", row.names = FALSE)
write.csv(contacts_data_NormSOandCY, "./MCZ_05162022_cleandata/contacts_data_NormSOandCY_05162022.csv", row.names = FALSE)
write.csv(Proximity_organelle_data, "./MCZ_05162022_cleandata/Proximity_organelle_data_05162022.csv", row.names = FALSE)

#combine all the selected and mutated columns to one data.frame using the cbind() function. The order you select the data.frames to combine with is the order appears on the combined data.frame. Use the subset() function to exclude identical columns, in this case the ImageNumber. Give this combined data.frame a simple name.


#Removing any NaN values that may have occurred during the mutate steps above. Fill them with 0.
# normalizeds[is.na(normalizeds)] <- 0
# normalized_size_shape_distribution[is.na(normalized_size_shape_distribution)] <- 0



#Separating treated and untreated data into two different files
#untreated_size_Shape_distribution <- normalized_size_shape_distribution %>% filter(Metadata_treatment=='before 50 uM Ars')
#NaAsO_size_Shape_distribution <- normalized_size_shape_distribution %>% filter(Metadata_treatment=='after 50 uM Ars')

#untreateds <- normalizeds %>% filter(Metadata_treatment=='before 50 uM Ars')
#NaAsOs <- normalizeds %>% filter(Metadata_treatment=='after 50 uM Ars')

