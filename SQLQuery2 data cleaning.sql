select *
from [Portfolio project]..Nashville

Select SaleDateConverted, Convert (date, SaleDate)
from [Portfolio project]..Nashville

Update [Portfolio project]..Nashville
Set SaleDate = Convert (date, SaleDate)

Alter table [Portfolio project]..Nashville
Add SaleDateConverted date

Update [Portfolio project]..Nashville
Set SaleDateConverted = Convert (date, SaleDate)

select *
From [Portfolio project]..Nashville
--where PropertyAddress is NULL
order by ParcelID

select a.ParcelID, a.Propertyaddress, b.ParcelID, b.Propertyaddress, ISNULL(a.Propertyaddress, b.PropertyAddress)
From [Portfolio project]..Nashville a
Join [Portfolio project]..Nashville b
On a.ParcelID = b.ParcelID
And a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is NULL

Update a
Set Propertyaddress = ISNULL(a.Propertyaddress, b.PropertyAddress)
From [Portfolio project]..Nashville a
Join [Portfolio project]..Nashville b
On a.ParcelID = b.ParcelID
And a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is NULL


Select 
SUBSTRING (Propertyaddress,1, CHARINDEX(',',Propertyaddress)-1) as address,
SUBSTRING (Propertyaddress, CHARINDEX(',',Propertyaddress)+1, LEN(Propertyaddress))
From [Portfolio project]..Nashville

Alter table [Portfolio project]..Nashville
Add Propertysplitaddress nvarchar(255)

Update [Portfolio project]..Nashville
Set Propertysplitaddress = SUBSTRING (Propertyaddress,1, CHARINDEX(',',Propertyaddress)-1)

Alter table [Portfolio project]..Nashville
Add PropertysplitCity nvarchar(255)

Update [Portfolio project]..Nashville
Set PropertysplitCity = SUBSTRING (Propertyaddress, CHARINDEX(',',Propertyaddress)+1, LEN(Propertyaddress))

select 
PARSENAME(Replace(owneraddress,',','.'),3),
PARSENAME(Replace(owneraddress,',','.'),2),
PARSENAME(Replace(owneraddress,',','.'),1)
From [Portfolio project]..Nashville


Alter table [Portfolio project]..Nashville
Add Ownersplitaddress nvarchar(255)

Update [Portfolio project]..Nashville
Set Ownersplitaddress = PARSENAME(Replace(owneraddress,',','.'),3)

Alter table [Portfolio project]..Nashville
Add OwnersplitCity nvarchar(255)

Update [Portfolio project]..Nashville
Set OwnersplitCity = PARSENAME(Replace(owneraddress,',','.'),2)

Alter table [Portfolio project]..Nashville
Add Ownersplitstate nvarchar(255)

Update [Portfolio project]..Nashville
Set Ownersplitstate = PARSENAME(Replace(owneraddress,',','.'),1)

Select *
From [Portfolio project]..Nashville


Select Distinct(SoldAsVacant), COUNT(SoldAsVacant)
From [Portfolio project]..Nashville
Group by SoldAsVacant
Order by 2


Select SoldAsVacant,
Case when SoldAsVacant = 'Y' Then 'Yes'
     when SoldAsVacant = 'N' Then 'No'
	 Else SoldAsVacant
	 End
From [Portfolio project]..Nashville


Update [Portfolio project]..Nashville
Set SoldAsVacant = Case when SoldAsVacant = 'Y' Then 'Yes'
     when SoldAsVacant = 'N' Then 'No'
	 Else SoldAsVacant
	 End


