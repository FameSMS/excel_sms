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

	// 2. set visible ���� �ʿ����� �ʽ��ϴ�. ���?
	excel.SetVisible(true);

	// 3. set active sheet. 2�� ° ��Ʈ�� ���� �а� ���� ���ؼ�
	excel.SetActiveSheet(2);

	// 4. get data C4�� ���� �����ͺ���
	char pData[256];
	excel.GetData("C4", pData);
	std::cout<<"data: "<<pData<<std::endl;

	// set data. C5�� ����
	memset(pData, 0x00, 256);
	strcpy( pData, "�׽�Ʈ");
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