dataset=read.csv('veri_seti.csv')
#Satislar bizim bagimli degiskenimiz.
## Verilerde eksik olmadigi icin ve hepsi de sayısal deger oldugu icin Veri Önişlemenin bazi kisimlarini atliyorum
## test ve egitim diye ikiye ayiracagim.
library(caTools) #Asagidaki fonksiyonu kullanmak icin yaptım.
set.seed(123)
split=sample.split(dataset$Satislar,SplitRatio = 0.8)
training_set= subset(dataset,split==TRUE)
test_set= subset(dataset,split==FALSE)
#Regresyon kismina geldik. Burada coklu regresyon yapacagim.
regresyon= lm(formula = Satislar ~.,data = training_set)

#Simdi tahmin yapip dogru mu yanlis mi bagimli var ama bagimsizlar ne kadar bagimliya etki ediyor.

summary(regresyon)
y_pred= predict(regresyon,newdata = test_set)
## Burada P testinden 1 yildiz alani cikartacagim
regresyon = lm(formula = Satislar ~ Reklam_Harcamalari + Musteri_Sayisi + Stok_Miktari,data = training_set)
summary(regresyon)
# Artik hepsi anlamli oldugu icin tahminlerimi yazacagim. Bu taktik Backward taktigidir.
y_pred= predict(regresyon,newdata = test_set)
## 1 yildizli olsa bile ne kadar etkisi oldugunu goreceksiniz bu yuzden hicbirini kaldirmamak en mantikli gibi gozukuyor.
regresyon= lm(formula = Satislar ~. , data=training_set)
summary(regresyon)
y_pred= predict(regresyon,newdata = test_set)
## Goruyorsunuz ki tahminler ile gercek sonuc birbirine yakin cikiyor.
