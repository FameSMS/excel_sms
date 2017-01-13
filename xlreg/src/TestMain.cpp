#include "windows.h"
#include "AloExcelAuto.h"
#include <iostream>

int main(int argc, char *argv[])
{
	CAloExcelAuto excel;

	if( excel.Init() < 0)
	{
		::MessageBox(NULL, "Fail to init excel", "Error", 0x10010);
		return 1;
	}

	if( !excel.CheckExcelInit() )
	{
		::MessageBox(NULL, "Excel is not initialzed", "Error", 0x10010);
		return 1;
	}

/*
	// 1. open an excel file
	excel.Open("C:\\test.xls");

	// 2. set visible 굳이 필요하진 않습니다. 쇼용?
	excel.SetVisible(true);

	// 3. set active sheet. 2번 째 시트의 값을 읽고 쓰기 위해서
	excel.SetActiveSheet(2);

	// 4. get data C4의 값을 가져와보기
	char pData[256];
	excel.GetData("C4", pData);
	std::cout<<"data: "<<pData<<std::endl;

	// set data. C5에 쓰기
	memset(pData, 0x00, 256);
	strcpy( pData, "테스트");
	excel.SetData("C5", pData);

	// save
	excel.Save();

	// close
	excel.Close();
*/
	std::cout << "Installing " << argv[1] << std::endl;

	excel.AddinInstall(argv[1]);
	excel.Close();

	return 0;
}