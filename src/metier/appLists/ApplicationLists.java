package metier.appLists;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.faces.model.SelectItem;

import dao.DAO;
import metier.finder.UserFinder;
import dao.Hibernate.Model.*;

/**
 * @author Y.ADIYA
 * @version 1.0
 * @Date 01/11/2008
 */
@SuppressWarnings(value = "unchecked")
public class ApplicationLists {

	public static List<Center> centerList = new ArrayList<Center>();
	public static List<SelectItem> centerListSI = new ArrayList<SelectItem>();
	public static List<Bank> bankList = new ArrayList<Bank>();
	public static List<Branch> branchList = new ArrayList<Branch>();
	public static List<CurrencyCountryEps> currencyList = new ArrayList<CurrencyCountryEps>();
	public static List<SelectItem> currencyListSI = new ArrayList<SelectItem>();
	public static List<City> cityList = new ArrayList<City>();
	public static List<SelectItem> cityListSI = new ArrayList<SelectItem>();
	public static List<UserManagement> userList = new ArrayList<UserManagement>();
	public static List<EpsHabilitationParam> epsHabilitationParamList = new ArrayList<EpsHabilitationParam>();
	public static List<SelectItem> epsHabilitationParamSI = new ArrayList<SelectItem>();
	public static List<SelectItem> brachListSI = new ArrayList<SelectItem>();
	public static Integer clientNumberMinLength = 1;
	public static Integer clientNumberMaxLength = 6;
	public static List<SelectItem> statusReasonSI = new ArrayList<SelectItem>();
	public static List<TransactionType> trx = new ArrayList<TransactionType>();
	
	public static List<Langue> langList = new ArrayList<Langue>();
	public static List<SelectItem> langListSI = new ArrayList<SelectItem>();
    //added by mostapha
	public static List<Merchants> merchantList = new ArrayList<Merchants>();
	public static List<Customers> customerList = new ArrayList<Customers>();
	public static List<ErrorsType> errorList = new ArrayList<ErrorsType>();
	public static List<TransactionDefinition> transactionList = new ArrayList<TransactionDefinition>();
	
	public static List<SelectItem> customerListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> merchantListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> transactionListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> errorsListSI = new ArrayList<SelectItem>();
	
	// added by jurin
	public static List<SelectItem> interfaceListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> bankListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> eventListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> messageListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> isoFieldListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> processListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> processListISOSI = new ArrayList<SelectItem>();
	public static List<SelectItem> networkListSI = new ArrayList<SelectItem>();
	public static List<BatchGroup> bgroupList = new ArrayList<BatchGroup>();
	public static List<SelectItem> bgroupListSI = new ArrayList<SelectItem>();
	public static List<BatchDetails> batchList = new ArrayList<BatchDetails>();
	public static List<SelectItem> batchListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> cardTypeListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> functionListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> collateralListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> accountTypeListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> roleGroupListSI = new ArrayList<SelectItem>();
	public static List<GroupMenuAccess> roleGroupList = new ArrayList<GroupMenuAccess>();
	// added by BATHAOUI
	public static List<SelectItem> actionDefinitionListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> actionDefinitionNoApprovedListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> mccListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> scriptStatusSI = new ArrayList<SelectItem>();
	public static List<SelectItem> statusReasonListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> uiAccStatusReasonSI= new ArrayList<SelectItem>();
	public static List<SelectItem> merchStatusReasonListSI= new ArrayList<SelectItem>();
	public static List<SelectItem> uiReplaceStatusReasonSI= new ArrayList<SelectItem>();
	public static List<SelectItem> uiCancelStatusReasonSI= new ArrayList<SelectItem>();
	public static List<SelectItem> countryListSI = new ArrayList<SelectItem>();
	public static List<Branch> cityCountryList = new ArrayList<Branch>();
	public static List<SelectItem> cityCountryListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> adminStatusListSI = new ArrayList<SelectItem>();
	// added by TARIK

	public static List<CurrencyCountryEps> currencyFeesList = new ArrayList<CurrencyCountryEps>();
	public static List<SelectItem> currencyFeesListSI = new ArrayList<SelectItem>();

	
	// ADDED BY AKIM
	public static List<SelectItem> currencyCountryListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> cardProductListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> fitVerListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> emvParamVerListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> manageCodeListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> stopListVerListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> pkiVerListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> reasonCodeListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> rejectReasonListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> networkCardTypeListSI = new ArrayList<SelectItem>();
	public static List<TransactionType> transactTypeList = new ArrayList<TransactionType>();
	public static List<SelectItem> transactTypeListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> reportGroupeListSI = new ArrayList<SelectItem>();
	public static List<BatchDetails> reportbatchNameList = new ArrayList<BatchDetails>();
	public static List<SelectItem> reportbatchNameListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> reportcodeListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> rgroupListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> reportListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> userNameListSI = new ArrayList<SelectItem>();
	public static List<UserManagement> userNameList = new ArrayList<UserManagement>();
	public static List<SelectItem> merchMccListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> merchNameListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> posNameListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> merchDurationListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> cityListSISecond = new ArrayList<SelectItem>();
	public static List<SelectItem> emailCodeListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> alertActionListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> onlineAlertParamListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> deviceIdListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> tableEPSListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> giftCodeListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> programIndexListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> cardStatusListSI = new ArrayList<SelectItem>();
	//merchantListSI

	// ADDED BY FARID
	public static List<SelectItem> currencyCountry2ListSI = new ArrayList<SelectItem>();
	public static List<CurrencyCountryEps> currencyCountry2List = new ArrayList<CurrencyCountryEps>();
	public static List<SelectItem> hostMaintenanceFeesListSI = new ArrayList<SelectItem>();
	public static List<SelectItem> hostInterestFeesListSI = new ArrayList<SelectItem>();

	
	// ADDED BY ZAK

	
	// FIN ZAKARIA

	public static List<SelectItem> keyMangeListSI =new ArrayList<SelectItem>();
	

	
	
	
	private List list = null;
	

	public ApplicationLists() {
		DAO dao = new DAO();

		iniStaticLists(dao);
	}
	
	public ApplicationLists(DAO dao) {

		loadStaticLists(dao);
	}

	public static void InitStaticLists() {
		/*DAO dao = new DAO();
		new ApplicationLists();*/

	}
	
	public static void LoadStaticLists() {
		
		DAO dao = new DAO();
		new ApplicationLists(dao);
	}

	/**
	 * @param dao
	 */
	public void iniStaticLists(DAO dao) {
		
	}
	public boolean loadStaticLists(DAO dao) {
		
		
		try {
			Langue lang = new Langue();
			list = dao.findByOrder(lang, "Langue", "langueCode");

			Iterator it_lang = list.iterator();
			langListSI = new ArrayList<SelectItem>();
			while (it_lang.hasNext()) {
				lang = (Langue) it_lang.next();
				langListSI.add(new SelectItem(lang.getLangueCode().trim(), lang
						.getWording()));
			}
		} catch (Exception e) {
			System.out.println("Langue1 not initialized");
		}
		
		try {
			Center centerEps = new Center();
			list = dao.findByOrder(centerEps, "Center", "centerCode");
			toList(centerList, list);

			Center centerEps1 = new Center();
			List<SelectItem> list11 = (List<SelectItem>) dao.findByOrder(
					centerEps1, "Center", "centerCode");
			Iterator it_center = list11.iterator();
			centerListSI = new ArrayList<SelectItem>();
			while (it_center.hasNext()) {
				centerEps1 = (Center) it_center.next();
				centerListSI.add(new SelectItem(centerEps1.getCenterCode()
						.trim(), centerEps1.getWording()));
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Center Lists not initialized");
		}
		
		try {

			CurrencyCountryEps currencyFees1 = new CurrencyCountryEps();
			list = dao.findByOrderAsc(currencyFees1, "CurrencyCountryEps",
					"wording");
			toList(currencyFeesList, list);

			CurrencyCountryEps currencyFees = new CurrencyCountryEps();
			List<SelectItem> listc = (List<SelectItem>) dao.findByOrderAsc(
					currencyFees, "CurrencyCountryEps", "wording");
			Iterator it_currency = listc.iterator();
			currencyFeesListSI = new ArrayList<SelectItem>();
			while (it_currency.hasNext()) {
				currencyFees = (CurrencyCountryEps) it_currency.next();
				currencyFeesListSI.add(new SelectItem(currencyFees
						.getCurrencyCode().trim(), currencyFees.getWording()));
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Currency Lists not initialized");
		}

		try {
			Branch branch1 = new Branch();
			list = dao.findByOrder(branch1, "Branch", "id.branchCode");
			toList(branchList, list);

			Branch branch = new Branch();
			List listb = dao.findByOrder(branch,"Branch", "id.branchCode");
			Iterator it_branch = listb.iterator();
			if (brachListSI != null && brachListSI.size() > 0) {
				  brachListSI.clear();
				}
			while (it_branch.hasNext()) {
				branch = (Branch) it_branch.next();
				brachListSI.add(new SelectItem(branch.getId().getBranchCode()
						.trim(), branch.getWording()));
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Branch Lists not initialized");
		}
/*       ==========================================================================
		 =                  Added By Mostafa                                      =
		 ==========================================================================
*/
	
		try {

			TransactionDefinition transaction = new TransactionDefinition();
			list = dao.findByOrder(transaction, "TransactionDefinition", "transactionCode");
			toList(transactionList, list);

			TransactionDefinition transaction1 = new TransactionDefinition();
			List<SelectItem> list1 = (List<SelectItem>) dao.findByOrder(
					transaction1, "TransactionDefinition", "transactionCode");
			Iterator it_transaction = list1.iterator();
			transactionListSI = new ArrayList<SelectItem>();
			while (it_transaction.hasNext()) {
				transaction1 = (TransactionDefinition) it_transaction.next();
				transactionListSI.add(new SelectItem(transaction1.getTransactionCode().trim(),
						transaction1.getDescription()));
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Transaction Lists not initialized");
		}
	
		try {

			ErrorsType error = new ErrorsType();
			list = dao.findByOrder(error, "ErrorsType", "errorCode");
			toList(errorList, list);

			ErrorsType error1 = new ErrorsType();
			List<SelectItem> list1 = (List<SelectItem>) dao.findByOrder(
					error1, "ErrorsType", "errorCode");
			Iterator it_error = list1.iterator();
			errorsListSI = new ArrayList<SelectItem>();
			while (it_error.hasNext()) {
				error1 = (ErrorsType) it_error.next();
				errorsListSI.add(new SelectItem(error1.getErrorCode().trim(), error1.getErrorName()));
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("errorsListSI Lists not initialized");
		}
			
			
		try {

			Customers customer = new Customers();
			list = dao.findByOrder(customer, "Customers", "msisdn");
			toList(customerList, list);

			Customers customer1 = new Customers();
			List<SelectItem> list1 = (List<SelectItem>) dao.findByOrder(
					customer1, "Customers", "msisdn");
			Iterator it_customer = list1.iterator();
			customerListSI = new ArrayList<SelectItem>();
			while (it_customer.hasNext()) {
				customer1 = (Customers) it_customer.next();
				customerListSI.add(new SelectItem(customer1.getMsisdn().trim(),
						customer1.getFirstName()+ "  "+ customer1.getLastName() ));
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Customers Lists not initialized");
		}
		
		
		try {

			Merchants merchant = new Merchants();
			list = dao.findByOrder(merchant, "Merchants", "msisdn");
			toList(merchantList, list);

			Merchants merchant1 = new Merchants();
			List<SelectItem> list1 = (List<SelectItem>) dao.findByOrder(
					merchant1, "Merchants", "msisdn");
			Iterator it_merchant = list1.iterator();
			merchantListSI = new ArrayList<SelectItem>();
			while (it_merchant.hasNext()) {
				merchant1 = (Merchants) it_merchant.next();
				merchantListSI.add(new SelectItem(merchant1.getMsisdn().trim(),
						merchant1.getFirstName()+ "  "+ merchant1.getLastName()));
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Merchant Lists not initialized");
		}
		
		
		
		try {

			Bank bankEps1 = new Bank();
			list = dao.findByOrder(bankEps1, "BankEps", "bankCode");
			toList(bankList, list);

			Bank bankEps = new Bank();
			List<SelectItem> list1 = (List<SelectItem>) dao.findByOrder(
					bankEps, "BankEps", "bankCode");
			Iterator it_bank = list1.iterator();
			bankListSI = new ArrayList<SelectItem>();
			while (it_bank.hasNext()) {
				bankEps = (Bank) it_bank.next();
				bankListSI.add(new SelectItem(bankEps.getBankCode().trim(),
						bankEps.getWording()));
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Bank Lists not initialized");
		}

		
		
		
		try {
			BatchDetails batch1 = new BatchDetails();
			list = dao.findByOrder(batch1, "BatchDetails", "id.batchCode");
			toList(batchList, list);

			BatchGroup bgroup1 = new BatchGroup();
			list = dao.findByOrder(bgroup1, "BatchGroup", "id.batchGroupCode");
			toList(bgroupList, list);

			BatchGroup group = new BatchGroup();
			List<SelectItem> list_group = (List<SelectItem>) dao
					.findByOrderAsc(group, "BatchGroup", "id.batchGroupCode");
			Iterator it_group = list_group.iterator();
			bgroupListSI = new ArrayList<SelectItem>();
			while (it_group.hasNext()) {
				group = (BatchGroup) it_group.next();
				bgroupListSI
						.add(new SelectItem(group.getId().getBatchGroupCode()
								.trim(), group.getBatchGroupName()));
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Batch Lists not initialized");
		}



		try {
			CurrencyCountryEps currencyEps = new CurrencyCountryEps();
			list = dao.findByOrder(currencyEps, "CurrencyCountryEps",
					"currencyCode");
			toList(currencyList, list);

			CurrencyCountryEps currencyCountryEps1 = new CurrencyCountryEps();
			list = dao.findByOrderAsc(currencyCountryEps1,
					"CurrencyCountryEps", "wording");
			Iterator it1 = list.iterator();
			currencyListSI = new ArrayList<SelectItem>();
			while (it1.hasNext()) {
				currencyCountryEps1 = (CurrencyCountryEps) it1.next();
				currencyListSI.add(new SelectItem(currencyCountryEps1
						.getCurrencyCode().trim(), currencyCountryEps1
						.getWordingCountry()));
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Country currency Lists not initialized");
		}

		try {
			// ADDED BY AKIM NKA
			CurrencyCountryEps currencyCountryEps2 = new CurrencyCountryEps();
			list = dao.findByOrderAsc(currencyCountryEps2, "CurrencyCountryEps",
					"currencyCode");
			Iterator it_c = list.iterator();
			currencyCountryListSI = new ArrayList<SelectItem>();
			while (it_c.hasNext()) {
				currencyCountryEps2 = (CurrencyCountryEps) it_c.next();
				currencyCountryListSI.add(new SelectItem(currencyCountryEps2
						.getCountryCode().trim(), currencyCountryEps2
						.getWordingCountry().trim()));
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Country Lists not initialized");
		}

		//ADDED BY FARID
			
		try {
		
			CurrencyCountryEps currencyCountryEps3 = new CurrencyCountryEps();
			list = dao.findByOrderAsc(currencyCountryEps3,
					"CurrencyCountryEps", "currencyCode");
			Iterator it_c3 = list.iterator();
			currencyCountry2ListSI = new ArrayList<SelectItem>();
			while (it_c3.hasNext()) {
				currencyCountryEps3 = (CurrencyCountryEps) it_c3.next();
				currencyCountry2ListSI.add(new SelectItem(currencyCountryEps3
						.getCountryCode().trim(), currencyCountryEps3
						.getWording().trim()));
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Country Lists not initialized");
		}

		try {
			BatchDetails batchDet = new BatchDetails();
			list = dao.findByOrderAsc(batchDet, "BatchDetails", "id.batchCode");
			Iterator it_bd = list.iterator();
			reportbatchNameListSI = new ArrayList<SelectItem>();
			while (it_bd.hasNext()) {
				batchDet = (BatchDetails) it_bd.next();
				reportbatchNameListSI
						.add(new SelectItem(batchDet.getId().getBatchCode()
								.trim(), batchDet.getBatchName().trim()));
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Report Batch Lists not initialized");
		}



		try {
			UserManagement userManagement = new UserManagement();
			list = dao
					.findByOrder(userManagement, "UserManagement", "userCode");
			toList(userNameList, list);

			List<SelectItem> list_user = (List<SelectItem>) dao.findByOrderAsc(
					userManagement, "UserManagement", "userCode");
			Iterator it_user = list_user.iterator();
			userNameListSI = new ArrayList<SelectItem>();
			userNameListSI.clear();
			while (it_user.hasNext()) {
				userManagement = (UserManagement) it_user.next();
				userNameListSI.add(new SelectItem(userManagement.getUserCode()
						.trim(), userManagement.getUserName().trim()));
			}

			// if (userList.isEmpty()) {
			UserFinder userFinder = new UserFinder();
			list = userFinder.findDistinctUsers();
			toList(userList, list);
			// }
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Users Lists not initialized");
		}
		

		try {
			City cityEps = new City();
			list = dao.findByOrder(cityEps, "City", "cityCode");
			toList(cityList, list);

			City city = new City();
			List<SelectItem> list1 = (List<SelectItem>) dao.findByOrder(city,
					"City", "cityCode");
			Iterator it_city = list1.iterator();
			cityListSI = new ArrayList<SelectItem>();
			while (it_city.hasNext()) {
				city = (City) it_city.next();
				cityListSI.add(new SelectItem(city.getCityCode().trim(), city
						.getWording()));
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("City Lists not initialized");
		}

		
		/*try {
			list = dao.findDistinctByGenCriteria("*", "USER_TABLES", " order by table_name asc");
						
			tableEPSListSI = new ArrayList<SelectItem>();
			Iterator it = list.iterator();
			while (it.hasNext()) {
				Object[] row = (Object[]) it.next();
				tableEPSListSI.add(new SelectItem(row[0].toString(),row[0].toString()));
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("List of table  not initialized");
		}*/

		try {
			EpsHabilitationParam epsHabilitationParam = new EpsHabilitationParam();
			list = dao.findByOrder(epsHabilitationParam,
					"EpsHabilitationParam", "code");
			toList(epsHabilitationParamList, list);

			EpsHabilitationParam epsHabilitationParam1 = new EpsHabilitationParam();
			list = dao.findByOrder(epsHabilitationParam1,
					"EpsHabilitationParam", "code");
			epsHabilitationParamSI = new ArrayList<SelectItem>();
			Iterator it = list.iterator();
			while (it.hasNext()) {
				epsHabilitationParam1 = (EpsHabilitationParam) it.next();
				epsHabilitationParamSI.add(new SelectItem(epsHabilitationParam1
						.getCode(), epsHabilitationParam1.getCode()));
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("EpsHabilitations Lists not initialized");
		}



////////////ADDED BY ZAK
	

		try {
			CurrencyCountryEps ccEps = new CurrencyCountryEps();

			list = dao.findByOrderAsc(ccEps, "CurrencyCountryEps",
					"wordingCountry");
			countryListSI = new ArrayList<SelectItem>();
			Iterator itccEps = list.iterator();
			while (itccEps.hasNext()) {
				ccEps = (CurrencyCountryEps) itccEps.next();
				countryListSI.add(new SelectItem(ccEps.getCountryCode().trim(),
						ccEps.getWordingCountry()));
			}
		} catch (Exception e) {
			System.out.println("CountryListSI not initialized");
		}
		
	
		return true;
}


	@SuppressWarnings( { "unchecked", "unused" })
	public static void initBrancheList(String bankCode) {
	

		
		DAO dao = new DAO();

		String cretiria = null;
		cretiria = " as model where 1=1 and model.id.bankCode like '%"
				+ bankCode + "%'";

		branchList = dao.findByGenCriteria("Branch", cretiria);

		Branch branch1 = new Branch();
		List<SelectItem> lists = (List<SelectItem>) dao.findByGenCriteria(
				"Branch", cretiria);
		Iterator it_status = lists.iterator();
		brachListSI = new ArrayList<SelectItem>();
		

		while (it_status.hasNext()) {
			branch1 = (Branch) it_status.next();
			brachListSI.add(new SelectItem(branch1.getId().getBranchCode()
					.trim(), branch1.getWording()));
		}

	}
	@SuppressWarnings( { "unchecked", "unused" })
	public static void initBranchList(String bankCode) {
		
		DAO dao = new DAO();
		branchList = dao.findListByproperty("Branch", "id.branchCode",
				"id.bankCode", bankCode);

		Branch branch1 = new Branch();
		List<SelectItem> lists = new ArrayList<SelectItem>();
		Iterator it_status = branchList.iterator();
		
		if (branchList.size() != 0){
			while (it_status.hasNext()) {
				branch1 = (Branch) it_status.next();
				lists.add(new SelectItem(branch1.getId().getBranchCode()
					.trim(), branch1.getWording()));
			}
		}
		brachListSI = lists;

	}

	@SuppressWarnings( { "unchecked", "unused" })
	

	
	



	public static void initRoleListSI(String groupName) {
		DAO dao = new DAO();
		GroupMenuAccess rolegroup = new GroupMenuAccess();
		List<SelectItem> roleListSI_Tmp = new ArrayList<SelectItem>();
		roleGroupList = dao.findListByproperty("GroupMenuAccess", "id.role", "id.groupName", groupName);
		if (roleGroupList.size() != 0) {
			
			Iterator it = roleGroupList.iterator();
			while (it.hasNext()) {
				rolegroup = (GroupMenuAccess) it.next();
				roleListSI_Tmp.add(new SelectItem(rolegroup.getId().getRole().trim(), rolegroup.getId().getRole().trim()));
			}
		}
		roleGroupListSI=roleListSI_Tmp;
	}
	
	
	// ######################################################
	// / FIN DE ZAKARIA
	// ######################################################


	@SuppressWarnings( { "unchecked", "unused" })
	public static void initBatchListSI(String batchGroup) {
		DAO dao = new DAO();
		BatchDetails batch = new BatchDetails();
		List<SelectItem> batchListSITmp = new ArrayList<SelectItem>();
		batchList = dao.findListByproperty("BatchDetails", "id.batchCode",
				"id.batchGroup", batchGroup);

		if (batchList.size() != 0) {

			Iterator it = batchList.iterator();
			while (it.hasNext()) {
				batch = (BatchDetails) it.next();
				batchListSITmp.add(new SelectItem(batch.getId().getBatchCode(),
						batch.getBatchName()));
			}

		}
		batchListSI = batchListSITmp;

	}



	/**
	 * @param set
	 * @return
	 */
	public static void toList(List resultList, List listFromDB) {
		resultList.clear();
		Iterator it = listFromDB.iterator();
		while (it.hasNext()) {
			resultList.add(it.next());
		}
	}

	// //////=========================================

	
	public List<CurrencyCountryEps> getCurrencyList() {
		return currencyList;
	}

	public void setCurrencyList(List<CurrencyCountryEps> currencyList) {
		this.currencyList = currencyList;
	}

	

	public List<UserManagement> getUserList() {
		return userList;
	}

	public void setUserList(List<UserManagement> userList) {
		this.userList = userList;
	}

	public List<EpsHabilitationParam> getEpsHabilitationParamList() {
		return epsHabilitationParamList;
	}

	public void setEpsHabilitationParamList(
			List<EpsHabilitationParam> epsHabilitationParamList) {
		ApplicationLists.epsHabilitationParamList = epsHabilitationParamList;
	}

	public List<SelectItem> getEpsHabilitationParamSI() {
		return epsHabilitationParamSI;
	}

	public void setEpsHabilitationParamSI(
			List<SelectItem> epsHabilitationParamSI) {
		ApplicationLists.epsHabilitationParamSI = epsHabilitationParamSI;
	}

	public List<Bank> getBankList() {
		return bankList;
	}

	public void setBankList(List<Bank> bankList) {
		ApplicationLists.bankList = bankList;
	}

	public List<Branch> getBranchList() {
		return branchList;
	}

	public void setBranchList(List<Branch> branchList) {
		ApplicationLists.branchList = branchList;
	}

	public List<SelectItem> getBrachListSI() {
		return brachListSI;
	}

	public void setBrachListSI(List<SelectItem> brachListSI) {
		ApplicationLists.brachListSI = brachListSI;
	}

	public List<SelectItem> getCityListSI() {
		return cityListSI;
	}

	public void setCityListSI(List<SelectItem> cityListSI) {
		ApplicationLists.cityListSI = cityListSI;
	}

	public List<SelectItem> getCurrencyListSI() {
		return currencyListSI;
	}

	public void setCurrencyListSI(List<SelectItem> currencyListSI) {
		ApplicationLists.currencyListSI = currencyListSI;
	}

	public Integer getClientNumberMinLength() {
		return clientNumberMinLength;
	}

	public void setClientNumberMinLength(Integer clientNumberMinLength) {
		ApplicationLists.clientNumberMinLength = clientNumberMinLength;
	}

	public Integer getClientNumberMaxLength() {
		return clientNumberMaxLength;
	}

	public void setClientNumberMaxLength(Integer clientNumberMaxLength) {
		ApplicationLists.clientNumberMaxLength = clientNumberMaxLength;
	}

	

	public List<SelectItem> getProcessListSI() {
		return processListSI;
	}

	public void setProcessListSI(List<SelectItem> processListSI) {
		ApplicationLists.processListSI = processListSI;
	}

	
	public List<SelectItem> getBankListSI() {
		return bankListSI;
	}

	public void setBankListSI(List<SelectItem> bankListSI) {
		ApplicationLists.bankListSI = bankListSI;
	}

	public List getEventListSI() {
		return eventListSI;
	}

	public void setEventListSI(List eventListSI) {
		ApplicationLists.eventListSI = eventListSI;
	}

	public List getInterfaceListSI() {
		return interfaceListSI;
	}

	public void setInterfaceListSI(List interfaceListSI) {
		ApplicationLists.interfaceListSI = interfaceListSI;
	}


	
	public List<CurrencyCountryEps> getCurrencyFeesList() {
		return currencyFeesList;
	}

	public void setCurrencyFeesList(List<CurrencyCountryEps> currencyFeesList) {
		ApplicationLists.currencyFeesList = currencyFeesList;
	}

	public List<SelectItem> getCurrencyFeesListSI() {
		return currencyFeesListSI;
	}

	public void setCurrencyFeesListSI(List<SelectItem> currencyFeesListSI) {
		ApplicationLists.currencyFeesListSI = currencyFeesListSI;
	}

	
	public List<SelectItem> getActionDefinitionListSI() {
		return actionDefinitionListSI;
	}

	public void setActionDefinitionListSI(
			List<SelectItem> actionDefinitionListSI) {
		ApplicationLists.actionDefinitionListSI = actionDefinitionListSI;
	}

	public List<SelectItem> getScriptStatusSI() {
		return scriptStatusSI;
	}

	public void setScriptStatusSI(List<SelectItem> scriptStatusSI) {
		ApplicationLists.scriptStatusSI = scriptStatusSI;
	}

	public List<SelectItem> getNetworkListSI() {
		return networkListSI;
	}

	public void setNetworkListSI(List<SelectItem> networkListSI) {
		ApplicationLists.networkListSI = networkListSI;
	}

	

	public List<SelectItem> getStatusReasonListSI() {
		return statusReasonListSI;
	}

	public void setStatusReasonListSI(List<SelectItem> statusReasonListSI) {
		ApplicationLists.statusReasonListSI = statusReasonListSI;
	}

	

	
	public List<SelectItem> getMccListSI() {
		return mccListSI;
	}

	public void setMccListSI(List<SelectItem> mccListSI) {
		ApplicationLists.mccListSI = mccListSI;
	}


	public List<SelectItem> getCurrencyCountryListSI() {
		return currencyCountryListSI;
	}

	
	public List<SelectItem> getMessageListSI() {
		return messageListSI;
	}

	public void setMessageListSI(List<SelectItem> messageListSI) {
		ApplicationLists.messageListSI = messageListSI;
	}


	public List<SelectItem> getIsoFieldListSI() {
		return isoFieldListSI;
	}

	public void setIsoFieldListSI(List<SelectItem> isoFieldListSI) {
		ApplicationLists.isoFieldListSI = isoFieldListSI;
	}


	public void setCurrencyCountryListSI(List<SelectItem> currencyCountryListSI) {
		ApplicationLists.currencyCountryListSI = currencyCountryListSI;
	}

	public List<SelectItem> getCardProductListSI() {
		return cardProductListSI;
	}

	public void setCardProductListSI(List<SelectItem> cardProductListSI) {
		ApplicationLists.cardProductListSI = cardProductListSI;
	}

	public List<SelectItem> getCountryListSI() {
		return countryListSI;
	}

	public void setCountryListSI(List<SelectItem> countryListSI) {
		ApplicationLists.countryListSI = countryListSI;
	}

	

	public List<BatchGroup> getBgroupList() {
		return bgroupList;
	}

	public List<SelectItem> getReasonCodeListSI() {
		return reasonCodeListSI;
	}

	public void setBgroupList(List<BatchGroup> bgroupList) {
		ApplicationLists.bgroupList = bgroupList;
	}

	public List<SelectItem> getBgroupListSI() {
		return bgroupListSI;
	}

	public void setBgroupListSI(List<SelectItem> bgroupListSI) {
		ApplicationLists.bgroupListSI = bgroupListSI;
	}

	public List<SelectItem> getBatchListSI() {
		return batchListSI;
	}

	public void setBatchListSI(List<SelectItem> batchListSI) {
		ApplicationLists.batchListSI = batchListSI;
	}

	
	public List<SelectItem> getCardTypeListSI() {
		return cardTypeListSI;
	}

	public void setCardTypeListSI(List<SelectItem> cardTypeListSI) {
		ApplicationLists.cardTypeListSI = cardTypeListSI;
	}



	
	public List<SelectItem> getFunctionListSI() {
		return functionListSI;
	}

	public void setFunctionListSI(List<SelectItem> functionListSI) {
		ApplicationLists.functionListSI = functionListSI;
	}

	public void setReasonCodeListSI(List<SelectItem> reasonCodeListSI) {
		reasonCodeListSI = reasonCodeListSI;
	}

	public List<SelectItem> getRejectReasonListSI() {
		return rejectReasonListSI;
	}

	public void setRejectReasonListSI(List<SelectItem> rejectReasonListSI) {
		rejectReasonListSI = rejectReasonListSI;
	}

	

	public List<SelectItem> getNetworkCardTypeListSI() {
		return networkCardTypeListSI;
	}

	public void setNetworkCardTypeListSI(List<SelectItem> networkCardTypeListSI) {
		ApplicationLists.networkCardTypeListSI = networkCardTypeListSI;
	}

	public List<TransactionType> getTransactTypeList() {
		return transactTypeList;
	}

	public void setTransactTypeList(List<TransactionType> transactTypeList) {
		ApplicationLists.transactTypeList = transactTypeList;
	}

	public List<SelectItem> getTransactTypeListSI() {
		return transactTypeListSI;
	}

	public void setTransactTypeListSI(List<SelectItem> transactTypeListSI) {
		ApplicationLists.transactTypeListSI = transactTypeListSI;
	}

	public List<SelectItem> getAccountTypeListSI() {
		return accountTypeListSI;
	}


	public void setAccountTypeListSI(List<SelectItem> accountTypeListSI) {
		ApplicationLists.accountTypeListSI = accountTypeListSI;
	}

	
	public List<SelectItem> getCenterListSI() {
		return centerListSI;
	}

	public List<SelectItem> getReportGroupeListSI() {
		return reportGroupeListSI;
	}

	public void setReportGroupeListSI(List<SelectItem> reportGroupeListSI) {
		ApplicationLists.reportGroupeListSI = reportGroupeListSI;
	}

	public List<BatchDetails> getReportbatchNameList() {
		return reportbatchNameList;
	}

	public void setReportbatchNameList(List<BatchDetails> reportbatchNameList) {
		ApplicationLists.reportbatchNameList = reportbatchNameList;
	}


	public List<SelectItem> getReportbatchNameListSI() {
		return reportbatchNameListSI;
	}

	
	public void setReportbatchNameListSI(List<SelectItem> reportbatchNameListSI) {
		ApplicationLists.reportbatchNameListSI = reportbatchNameListSI;
	}

	public List<SelectItem> getReportcodeListSI() {
		return reportcodeListSI;
	}

	public void setReportcodeListSI(List<SelectItem> reportcodeListSI) {
		ApplicationLists.reportcodeListSI = reportcodeListSI;
	}

	public List<SelectItem> getRgroupListSI() {
		return rgroupListSI;
	}

	public void setRgroupListSI(List<SelectItem> rgroupListSI) {
		rgroupListSI = rgroupListSI;
	}

	public List<SelectItem> getReportListSI() {
		return reportListSI;
	}

	public void setReportListSI(List<SelectItem> reportListSI) {
		ApplicationLists.reportListSI = reportListSI;
	}

	public List<SelectItem> getUserNameListSI() {
		return userNameListSI;
	}

	public void setUserNameListSI(List<SelectItem> userNameListSI) {
		ApplicationLists.userNameListSI = userNameListSI;
	}

	public List<UserManagement> getUserNameList() {
		return userNameList;
	}

	public void setUserNameList(List<UserManagement> userNameList) {
		ApplicationLists.userNameList = userNameList;
	}

	public void setCenterListSI(List<SelectItem> centerListSI) {
		ApplicationLists.centerListSI = centerListSI;
	}


	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public List<SelectItem> getCurrencyCountry2ListSI() {
		return currencyCountry2ListSI;
	}

	public void setCurrencyCountry2ListSI(
			List<SelectItem> currencyCountry2ListSI) {
		ApplicationLists.currencyCountry2ListSI = currencyCountry2ListSI;
	}

	public List<CurrencyCountryEps> getCurrencyCountry2List() {
		return currencyCountry2List;
	}

	public void setCurrencyCountry2List(
			List<CurrencyCountryEps> currencyCountry2List) {
		ApplicationLists.currencyCountry2List = currencyCountry2List;
	}

	public  List<SelectItem> getHostMaintenanceFeesListSI() {
		return hostMaintenanceFeesListSI;
	}

	public  void setHostMaintenanceFeesListSI(
			List<SelectItem> hostMaintenanceFeesListSI) {
		ApplicationLists.hostMaintenanceFeesListSI = hostMaintenanceFeesListSI;
	}

	public  List<SelectItem> getHostInterestFeesListSI() {
		return hostInterestFeesListSI;
	}

	
	public  List<Branch> getCityCountryList() {
		return cityCountryList;
	}

	public  void setCityCountryList(List<Branch> cityCountryList) {
		ApplicationLists.cityCountryList = cityCountryList;
	}

	public  List<SelectItem> getCityCountryListSI() {
		return cityCountryListSI;
	}

	public static void setCityCountryListSI(List<SelectItem> cityCountryListSI) {
		ApplicationLists.cityCountryListSI = cityCountryListSI;
	}

	public List<SelectItem> getStatusReasonSI() {
		return statusReasonSI;
	}

	public void setStatusReasonSI(List<SelectItem> statusReasonSI) {
		ApplicationLists.statusReasonSI = statusReasonSI;
	}

	public List<SelectItem> getProcessListISOSI() {
		return processListISOSI;
	}

	public void setProcessListISOSI(List<SelectItem> processListISOSI) {
		ApplicationLists.processListISOSI = processListISOSI;
	}
	


	public List<SelectItem> getKeyMangeListSI() {
		return this.keyMangeListSI;
	}

	public void setKeyMangeListSI(List<SelectItem> keyMangeListSI) {
		this.keyMangeListSI = keyMangeListSI;
	}


	public  void setatmPrintTextTypeListSI(
			List<SelectItem> atmPrintTextTypeListSI) {
		atmPrintTextTypeListSI = atmPrintTextTypeListSI;
	}

	public  List<SelectItem> getFitVerListSI() {
		return fitVerListSI;
	}

	public  void setFitVerListSI(List<SelectItem> fitVerListSI) {
		ApplicationLists.fitVerListSI = fitVerListSI;
	}

	public  List<SelectItem> getEmvParamVerListSI() {
		return emvParamVerListSI;
	}

	public  void setEmvParamVerListSI(List<SelectItem> emvParamVerListSI) {
		ApplicationLists.emvParamVerListSI = emvParamVerListSI;
	}

	public  List<SelectItem> getPkiVerListSI() {
		return pkiVerListSI;
	}

	public  void setPkiVerListSI(List<SelectItem> pkiVerListSI) {
		ApplicationLists.pkiVerListSI = pkiVerListSI;
	}

	public List<SelectItem> getUiAccStatusReasonSI() {
		return uiAccStatusReasonSI;
	}

	public void setUiAccStatusReasonSI(List<SelectItem> uiAccStatusReasonSI) {
		ApplicationLists.uiAccStatusReasonSI = uiAccStatusReasonSI;
	}

	
	public static List<SelectItem> getUiReplaceStatusReasonSI() {
		return uiReplaceStatusReasonSI;
	}

	public static void setUiReplaceStatusReasonSI(
			List<SelectItem> uiReplaceStatusReasonSI) {
		ApplicationLists.uiReplaceStatusReasonSI = uiReplaceStatusReasonSI;
	}

	public List<SelectItem> getUiCancelStatusReasonSI() {
		return uiCancelStatusReasonSI;
	}

	public void setUiCancelStatusReasonSI(
			List<SelectItem> uiCancelStatusReasonSI) {
		ApplicationLists.uiCancelStatusReasonSI = uiCancelStatusReasonSI;
	}

	public  List<SelectItem> getStopListVerListSI() {
		return stopListVerListSI;
	}

	public  void setStopListVerListSI(List<SelectItem> stopListVerListSI) {
		ApplicationLists.stopListVerListSI = stopListVerListSI;
	}

	public  List<SelectItem> getManageCodeListSI() {
		return manageCodeListSI;
	}

	public  void setManageCodeListSI(List<SelectItem> manageCodeListSI) {
		ApplicationLists.manageCodeListSI = manageCodeListSI;
	}

	public List<SelectItem> getCollateralListSI() {
		return collateralListSI;
	}

	public void setCollateralListSI(List<SelectItem> collateralListSI) {
		ApplicationLists.collateralListSI = collateralListSI;
	}


	public  List<SelectItem> getCityListSISecond() {
		return cityListSISecond;
	}

	public  void setCityListSISecond(List<SelectItem> cityListSISecond) {
		ApplicationLists.cityListSISecond = cityListSISecond;
	}

	public  List<SelectItem> getMerchStatusReasonListSI() {
		return merchStatusReasonListSI;
	}

	public void setMerchStatusReasonListSI(
			List<SelectItem> merchStatusReasonListSI) {
		ApplicationLists.merchStatusReasonListSI = merchStatusReasonListSI;
	}


	public  List<SelectItem> getMerchDurationListSI() {
		return merchDurationListSI;
	}

	public  void setMerchDurationListSI(List<SelectItem> merchDurationListSI) {
		ApplicationLists.merchDurationListSI = merchDurationListSI;
	}

	public  List<SelectItem> getEmailCodeListSI() {
		return emailCodeListSI;
	}

	public  void setEmailCodeListSI(List<SelectItem> emailCodeListSI) {
		ApplicationLists.emailCodeListSI = emailCodeListSI;
	}

	public  List<SelectItem> getAlertActionListSI() {
		return alertActionListSI;
	}

	public  void setAlertActionListSI(List<SelectItem> alertActionListSI) {
		ApplicationLists.alertActionListSI = alertActionListSI;
	}

	public  List<SelectItem> getOnlineAlertParamListSI() {
		return onlineAlertParamListSI;
	}

	public  void setOnlineAlertParamListSI(
			List<SelectItem> onlineAlertParamListSI) {
		ApplicationLists.onlineAlertParamListSI = onlineAlertParamListSI;
	}


	public List<SelectItem> getActionDefinitionNoApprovedListSI() {
		return actionDefinitionNoApprovedListSI;
	}

	public void setActionDefinitionNoApprovedListSI(
			List<SelectItem> actionDefinitionNoApprovedListSI) {
		ApplicationLists.actionDefinitionNoApprovedListSI = actionDefinitionNoApprovedListSI;
	}

	public  List<SelectItem> getPosNameListSI() {
		return posNameListSI;
	}

	public  void setPosNameListSI(List<SelectItem> posNameListSI) {
		ApplicationLists.posNameListSI = posNameListSI;
	}

	public  List<SelectItem> getDeviceIdListSI() {
		return deviceIdListSI;
	}

	public  void setDeviceIdListSI(List<SelectItem> deviceIdListSI) {
		ApplicationLists.deviceIdListSI = deviceIdListSI;
	}

	public  List<SelectItem> getTableEPSListSI() {
		return tableEPSListSI;
	}

	public  void setTableEPSListSI(List<SelectItem> tableEPSListSI) {
		ApplicationLists.tableEPSListSI = tableEPSListSI;
	}

	public List<SelectItem> getAdminStatusListSI() {
		return adminStatusListSI;
	}

	public void setAdminStatusListSI(List<SelectItem> adminStatusListSI) {
		ApplicationLists.adminStatusListSI = adminStatusListSI;
	}

	public  List<SelectItem> getGiftCodeListSI() {
		return giftCodeListSI;
	}

	public  void setGiftCodeListSI(List<SelectItem> giftCodeListSI) {
		ApplicationLists.giftCodeListSI = giftCodeListSI;
	}

	public  List<SelectItem> getProgramIndexListSI() {
		return programIndexListSI;
	}

	public  void setProgramIndexListSI(List<SelectItem> programIndexListSI) {
		ApplicationLists.programIndexListSI = programIndexListSI;
	}

	public  List<SelectItem> getCardStatusListSI() {
		return cardStatusListSI;
	}

	public  void setCardStatusListSI(List<SelectItem> cardStatusListSI) {
		ApplicationLists.cardStatusListSI = cardStatusListSI;
	}

	public  List<Center> getCenterList() {
		return centerList;
	}

	public  void setCenterList(List<Center> centerList) {
		ApplicationLists.centerList = centerList;
	}

	public  List<City> getCityList() {
		return cityList;
	}

	public  void setCityList(List<City> cityList) {
		ApplicationLists.cityList = cityList;
	}

	public  List<Langue> getLangList() {
		return langList;
	}

	public  void setLangList(List<Langue> langList) {
		ApplicationLists.langList = langList;
	}

	public  List<SelectItem> getLangListSI() {
		return langListSI;
	}

	public  void setLangListSI(List<SelectItem> langListSI) {
		ApplicationLists.langListSI = langListSI;
	}
	// find by abdi
	
	public  List<SelectItem> getCustomerListSI() {
		return customerListSI;
	}

	public  void setCustomerListSI(List<SelectItem> customerListSI) {
		ApplicationLists.customerListSI = customerListSI;
	}

	public  List<SelectItem> getMerchantListSI() {
		return merchantListSI;
	}

	public  void setMerchantListSI(List<SelectItem> merchantListSI) {
		ApplicationLists.merchantListSI = merchantListSI;
	}

	public  List<SelectItem> getTransactionListSI() {
		return transactionListSI;
	}

	public  void setTransactionListSI(List<SelectItem> transactionListSI) {
		ApplicationLists.transactionListSI = transactionListSI;
	}

	public  List<SelectItem> getErrorsListSI() {
		return errorsListSI;
	}

	public  void setErrorsListSI(List<SelectItem> errorsListSI) {
		ApplicationLists.errorsListSI = errorsListSI;
	}

	

	
	
}
