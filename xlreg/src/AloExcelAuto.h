/**
 * @file	AloExcelAuto.h
 * @brief   CAloExcelAuto class 
 * @author	alones
 * @date initial version: 2007.07.22 
 */

#include "ole2.h"		// OLE2 Definitions

/**
 * @class CAloExcelAuto
 * @brief excel automation class
 */
class CAloExcelAuto
{
private:
	bool		m_bCOMInited;	/**< check if com ini*/
	bool		m_bInit ;		/**< check if excel init */

	struct PROPERTIES
	{
		IDispatch *pXlApp;		/**< Excel.exe */
		IDispatch *pXlBooks;	/**< Ptr To MainFrame -> Can open new Workbooks */
		IDispatch *pXlBook;		/**< A Workbook. Has more Sheets (Z-Layers) */
		IDispatch *pXlSheet;	/**< What U see. Has X and Y*/
	} m_instance;
	
public:	
	/**
	 * @brief make excel app visible or not
	 * @param[in]	bVisible(bool) if true, make excel app visibile
	 * @return		int	if success 1, otherwise negative number
	*/
	int SetVisible(bool bVisible);

	/**
	 * @brief opne excel file 
	 * @return		int	if success 1, otherwise negative number
	 */
	int Open(const char* file);

	/**
	 * @brief set active sheet
	 */
	int SetActiveSheet(int nSheet);

	/**
	 * @brief		get cell data on current active sheet
	 * @param[in]	pPos (char*)	cell position e.g. B4
	 * @param[out]	pData (char*)	cell data. string
	 */
	bool GetData(char* pPos, char* pData);

	/**
	 * @brief		set cell data on current active sheet
	 * @param[in]	pPos (char*)	cell position e.g. B4
	 * @param[in]	pData (char*)	cell data. string
	 */
	bool SetData(char* pPos, char* pData);

	/**
	 * @brief save workbook
	 */
	void Save();

	/**
	 * @brief close workbook
	 */
	void Close();

	void AddinInstall(const char *fname);
	void AddinUninstall(const char *fname);

public:
	/**
	 * @brief Open a new Excel Window and create a new worksheet
	 */
	int Init();

	/**
	 * @brief	check if excel init
	 * @return	if excel init, return true, otherwise false
	 */
	bool CheckExcelInit(){return m_bInit;};


	/**
	 * @brief		open excel file
	 * @param[in]	strpath (std::string) excel path
	 * @param[out]	nError (int&) error code
	 * @code
	 *		int nError;
	 *		bool Open("test.xls", nError);
	 * @endcode
	 * @return		if sucess ture, otherwise false
	 * @see			Close();		
	 */
	//bool Open(std::string strPath, int& nError);

	/**
	 * @brief		open excel file
	 * @param[in]	strpath (std::string) excel path
	 * @param[out]	nError (int&) error code
	 * @code
	 *		int nError;
	 *		bool Open("test.xls", nError);
	 * @endcode
	 * @return		if sucess ture, otherwise false
	 * @see			
	 */
	//bool Close(int n);

	// constructor & destructor
public:
	/**
	 * @brief constructor
	 */
	CAloExcelAuto();

	/**
	 * @brief destructor
	 */
	virtual ~CAloExcelAuto();

};
