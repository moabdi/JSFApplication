/////////////////////////////////// ATTENTION //////////////////////////////////////////
//  Pour afficher un item non-dynamique (non dépendant des habilitations,             //
//  rajouter le paramètre "STATIC" comme dernier paramètre de la function addMenu().  //
//  exemple : addMenu(mainMenu, new milonicMenu("Aide", "menuAide"));       //
////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////// Menu principal ///////////////////////////
var mainMenu = new Array() ;
addMenu(mainMenu, new milonicMenu("Parameters", "menuMbankParam"));
addMenu(mainMenu, new milonicMenu("Mobile Banking", "menuMobilebank"));
addMenu(mainMenu, new milonicMenu("Help", "menuHelp"));

/////////////////////////// Menu Parameters ///////////////////////////
var menuMbankParam = new Array();

addMenu(menuMbankParam, new milonicMenu(". General", "menuCustomers"));
addMenu(menuMbankParam, new milonicMenu(". Mobile Banking ", "menuMerchants"));
addMenu(menuMbankParam, new milonicMenu(". Security", "menuTransactions"));

/////////////////////////// Menu Parameters ///////////////////////////
var menuMobilebank = new Array();

addMenu(menuMobilebank, new milonicMenu(". General", "menuCustomers"));
addMenu(menuMobilebank, new milonicMenu(". Mobile Banking ", "menuMerchants"));
addMenu(menuMobilebank, new milonicMenu(". Security", "menuTransactions"));

//////////////////////////S.M.Parameters Menu Merchant Param/////////////////////////////
var menuMerchants = new Array();
addMenu(menuMerchants, new milonicMenu(". Customers", null, "../pages/userManagement/customerParamSearch.jsf", "separatorsize=1;" ), "STATIC");
//addMenu(menuMerchant, new milonicMenu(". Comission", null, "../pages/param/merchant/MerchantCommissionSearch.jsf", "separatorsize=1;" ));
//addMenu(menuMerchant, new milonicMenu(". Var Comission", null, "../pages/param/merchant/MerchantVarCommissionSearch.jsf", "separatorsize=1;" ));
//addMenu(menuMerchant, new milonicMenu(". Floor Limits", null, "../pages/param/merchant/MerchantFLimitSearch.jsf", "separatorsize=1;" ));
//addMenu(menuMerchant, new milonicMenu(". Limits", null, "../pages/param/merchant/MerchantLimitSearch.jsf", "separatorsize=1;" ));

//////////////////////////S.M.Parameters Menu Merchant Param/////////////////////////////
var menuCustomers = new Array();
addMenu(menuCustomers, new milonicMenu(". Merchants", null, "../pages/userManagement/merchantParamSearch.jsf", "separatorsize=1;" ), "STATIC");
//addMenu(menuCustomer, new milonicMenu(". Comission", null, "../pages/param/merchant/MerchantCommissionSearch.jsf", "separatorsize=1;" ));
//addMenu(menuCustomer, new milonicMenu(". Var Comission", null, "../pages/param/merchant/MerchantVarCommissionSearch.jsf", "separatorsize=1;" ));
//addMenu(menuCustomer, new milonicMenu(". Floor Limits", null, "../pages/param/merchant/MerchantFLimitSearch.jsf", "separatorsize=1;" ));
//addMenu(menuCustomer, new milonicMenu(". Limits", null, "../pages/param/merchant/MerchantLimitSearch.jsf", "separatorsize=1;" ));

//////////////////////////S.M.Parameters Menu Merchant Param/////////////////////////////
var menuTransactions = new Array();
addMenu(menuTransactions, new milonicMenu(". Transaction", null, "../pages/userManagement/Transactions.jsf", "separatorsize=1;" ), "STATIC");

//////////////////////////S.M.Parameters Menu Merchant Param/////////////////////////////
var menuErrors = new Array();
addMenu(menuErrors, new milonicMenu(". Errors", null, "../pages/userManagement/errors.jsf", "separatorsize=1;" ), "STATIC");


////////////////////////// S.M.POS //////////////////////////////////////
var menuPosParam = new Array();
addMenu(menuPosParam, new milonicMenu(". Management", null, "../pages/param/merchant/PosManagementSearch.jsf", "separatorsize=1;" ));
addMenu(menuPosParam, new milonicMenu(". Fit", null, "../pages/param/merchant/PosFitSearch.jsf", "separatorsize=1;" ));
addMenu(menuPosParam, new milonicMenu(". Emv CA", null, "../pages/param/merchant/PosEmvCaPKSearch.jsf", "separatorsize=1;" ));
addMenu(menuPosParam, new milonicMenu(". Emv AID", null, "../pages/param/merchant/PosEmvAIDSearch.jsf", "separatorsize=1;" ));
addMenu(menuPosParam, new milonicMenu(". Stop List", null, "../pages/param/merchant/StopListSearch.jsf", "separatorsize=1;" ));


//////////////////////////////S.M.LOYALTY  //////////////////////////////////////////////
var menuLoyalty=new Array();
addMenu(menuLoyalty, new milonicMenu(". Index", null, "../pages/param/loyalty/ProgramIndexSearch.jsf", "separatorsize=1;" ));
addMenu(menuLoyalty, new milonicMenu(". Definition", null, "../pages/param/loyalty/ProgramDefinitionSearch.jsf", "separatorsize=1;" ));
addMenu(menuLoyalty, new milonicMenu(". Gift", null, "../pages/param/loyalty/ProgramGiftSearch.jsf", "separatorsize=1;" ));
addMenu(menuLoyalty, new milonicMenu(". Redemption", null, "../pages/param/loyalty/ProgramRedemptionSearch.jsf", "separatorsize=1;" ));
addMenu(menuLoyalty, new milonicMenu(". Conversion", null, "../pages/param/loyalty/ProgramConversionSearch.jsf", "separatorsize=1;" ));



////////////////////////////S.M.Key Management ////////////////////////////////////////
var menuKeyManagement = new Array();
addMenu(menuKeyManagement, new milonicMenu(". Generation", null,"../pages/param/keyManagement/generation/keyGeneration.jsf", "separatorsize=1;" ));
addMenu(menuKeyManagement, new milonicMenu(". Integration", null,"../pages/param/keyManagement/integration/keyIntegration.jsf", "separatorsize=1;" ));
addMenu(menuKeyManagement, new milonicMenu(". Transmission", null,"../pages/param/keyManagement/transmission/keyTransmission.jsf", "separatorsize=1;" ));
addMenu(menuKeyManagement, new milonicMenu(". Command", null, "../pages/param/keyManagement/command.jsf", "separatorsize=1;" ), "STATIC")

//////////////////////////S.M.Parameters Menu Atm Param/////////////////////////////
var menuAtmParam = new Array();
addMenu(menuAtmParam, new milonicMenu(". Groupe", null, "../pages/param/atm/terminalGroupSearch.jsf", "separatorsize=1;" ));
addMenu(menuAtmParam, new milonicMenu(". Cassette", "menuAtmCassette"));
addMenu(menuAtmParam, new milonicMenu(". Profiles", "menuAtmProfile"));
addMenu(menuAtmParam, new milonicMenu(". Services", "menuAtmServices"));
addMenu(menuAtmParam, new milonicMenu(". Printer", "menuAtmPrinterParam"));
addMenu(menuAtmParam, new milonicMenu(". Response", "menuAtmReplayParam"));
addMenu(menuAtmParam, new milonicMenu(". Status parameters", null, "../pages/param/atm/alertParamSearch.jsf", "separatorsize=1;" ));

//////////////////////////S.M.Parameters Menu Replay Param/////////////////////////////
var menuAtmReplayParam = new Array();
addMenu(menuAtmReplayParam, new milonicMenu(". Message", null, "../pages/param/atm/replayManagementSearch.jsf", "separatorsize=1;" ));
addMenu(menuAtmReplayParam, new milonicMenu(". Switch", null, "../pages/param/atm/responseManagementSearch.jsf", "separatorsize=1;" ));

//////////////////////////S.M.Parameters Menu Services Param/////////////////////////////
var menuAtmServices = new Array();
addMenu(menuAtmServices, new milonicMenu(". FDK Definition", null, "../pages/param/atm/fdkManagementSearch.jsf", "separatorsize=1;" ));
addMenu(menuAtmServices, new milonicMenu(". Management", null, "../pages/param/atm/atmIsoManagementSearch.jsf", "separatorsize=1;" ));

//////////////////////////S.M.Parameters Menu Cassette Param/////////////////////////////
var menuAtmCassette = new Array();
addMenu(menuAtmCassette, new milonicMenu(". Definition", null, "../pages/param/atm/cassettesSearch.jsf", "separatorsize=1;" ));
addMenu(menuAtmCassette, new milonicMenu(". Distribution", null, "../pages/param/atm/atmDistributionSearch.jsf", "separatorsize=1;" ));

//////////////////////////S.M.Parameters Menu Printer Param/////////////////////////////
var menuAtmPrinterParam = new Array();
addMenu(menuAtmPrinterParam, new milonicMenu(". Receipt", null, "../pages/param/atm/printLayoutRctSearch.jsf", "separatorsize=1;" ));
addMenu(menuAtmPrinterParam, new milonicMenu(". Journal", null, "../pages/param/atm/printLayoutJnrSearch.jsf", "separatorsize=1;" ));
addMenu(menuAtmPrinterParam, new milonicMenu(". Enveloppe", null, "../pages/param/atm/printLayoutEnvSearch.jsf", "separatorsize=1;" ));

//////////////////////////S.M.Parameters Menu Profile Param/////////////////////////////
var menuAtmProfile = new Array();
addMenu(menuAtmProfile, new milonicMenu(". Definition", null, "../pages/param/atm/atmProfileSearch.jsf", "separatorsize=1;" ));
addMenu(menuAtmProfile, new milonicMenu(". Management", null, "../pages/param/atm/profilDefinitionSearch.jsf", "separatorsize=1;" ));
addMenu(menuAtmProfile, new milonicMenu(". NDC Parameters", null, "../pages/param/atm/treeAtmParameters.jsf", "separatorsize=1;" ));

//////////////////////////S.M.Parameters Menu Authorization Param/////////////////////////////
var menuAuthorizationParam = new Array();
var menuAuthorizationParamAct = new Array();
var menuAuthorizationParamLim = new Array();
var menuAuthorizationParamRouting = new Array();
var menuAuthorizationParamControl = new Array();

addMenu(menuAuthorizationParam, new milonicMenu(". Authorisation Fees", null, "../pages/param/authorization/AuthoFeesSearch.jsf", "separatorsize=1;" ));
addMenu(menuAuthorizationParam, new milonicMenu(". Action", "menuAuthorizationParamAct"));
addMenu(menuAuthorizationParamAct, new milonicMenu(". Definition", null, "../pages/param/general/ActionDefinitionSearch.jsf", "separatorsize=1;" ));
addMenu(menuAuthorizationParamAct, new milonicMenu(". Management", null, "../pages/param/authorization/actionManagementSearch.jsf", "separatorsize=1;" ));
addMenu(menuAuthorizationParamAct, new milonicMenu(". Translation", null, "../pages/param/authorization/actionTranslationSearch.jsf", "separatorsize=1;" ));
addMenu(menuAuthorizationParam, new milonicMenu(". Internal Routing", null, "../pages/param/authorization/InternalRoutingSearch.jsf", "separatorsize=1;" ));
addMenu(menuAuthorizationParam, new milonicMenu(". Control", "menuAuthorizationParamControl"));
addMenu(menuAuthorizationParamControl, new milonicMenu(". Amount Origine", null, "../pages/param/authorization/cAuthAmtOrigSearch.jsf", "separatorsize=1;" ));
addMenu(menuAuthorizationParamControl, new milonicMenu(". Online event", null, "../pages/param/general/OnlineEventSearch.jsf", "separatorsize=1;" )); 
addMenu(menuAuthorizationParamControl, new milonicMenu(". Online Control", null, "../pages/param/authorization/onlineControlParamSearch.jsf", "separatorsize=1;" ));
addMenu(menuAuthorizationParamControl, new milonicMenu(". EMV Control", null, "../pages/param/authorization/emvControlParam.jsf", "separatorsize=1;" ));
addMenu(menuAuthorizationParamControl, new milonicMenu(". ISO Message Control", null, "../pages/param/authorization/msgControlParamSearch.jsf", "separatorsize=1;" ));
addMenu(menuAuthorizationParam, new milonicMenu(". Limit", "menuAuthorizationParamLim"));
addMenu(menuAuthorizationParamLim, new milonicMenu(". Definition", null, "../pages/param/authorization/limitsAuthSearch.jsf", "separatorsize=1;" )); 
addMenu(menuAuthorizationParamLim, new milonicMenu(". By Process", null, "../pages/param/authorization/limitsByProcessSearch.jsf", "separatorsize=1;" )); 
addMenu(menuAuthorizationParamLim, new milonicMenu(". Total", null, "../pages/param/authorization/limitsTotalSearch.jsf", "separatorsize=1;" )); 
 
/////////////////////////// Menu Host //////////////////////////////////////////////////////
var menuHost = new Array();

addMenu(menuHost , new milonicMenu(". Capture ", "menuCaptureHost"));
addMenu(menuHost , new milonicMenu(". Validate ", "menuvalidateHost"));
addMenu(menuHost , new milonicMenu(". Search ", "menuSearchHost"));
addMenu(menuHost , new milonicMenu(". New Specs ", "menuNewHost"));

var menuCaptureHost = new Array();
addMenu(menuCaptureHost, new milonicMenu(". Client", null, "../pages/arabe/hostClientCapture_ara.jsf", "separatorsize=1;" ));
addMenu(menuCaptureHost, new milonicMenu(". Client", null, "../pages/host/hostClientCapture.jsf", "separatorsize=1;" ));
addMenu(menuCaptureHost, new milonicMenu(". Account", null, "../pages/host/hostAccountCaptureAdd.jsf", "separatorsize=1;" ));
addMenu(menuCaptureHost, new milonicMenu(". Device Account", null, "../pages/host/hostDeviceAccountCaptureAdd.jsf", "separatorsize=1;" ));
addMenu(menuCaptureHost, new milonicMenu(". Deposit", null, "../pages/host/hostDepositCapture.jsf", "separatorsize=1;" ));
addMenu(menuCaptureHost, new milonicMenu(". Transfer", null, "../pages/host/hostTransferCapture.jsf", "separatorsize=1;" ));

var menuvalidateHost = new Array();
addMenu(menuvalidateHost, new milonicMenu(". Deposit", null, "../pages/host/hostDepositValidation.jsf", "separatorsize=1;" ));
addMenu(menuvalidateHost, new milonicMenu(". Transfer", null, "../pages/host/hostTransfertValidation.jsf", "separatorsize=1;" ));

var menuSearchHost = new Array();
addMenu(menuSearchHost, new milonicMenu(". Client", null, "../pages/host/HostClientSearch.jsf", "separatorsize=1;" ));
addMenu(menuSearchHost, new milonicMenu(". Account", null, "../pages/host/hostAccountSearch.jsf", "separatorsize=1;" ));
addMenu(menuSearchHost, new milonicMenu(". Device Account", null, "../pages/host/hostDeviceAccountSearch.jsf", "separatorsize=1;" ));
addMenu(menuSearchHost, new milonicMenu(". Deposit", null, "../pages/host/hostDepositSearch.jsf", "separatorsize=1;" ));
addMenu(menuSearchHost, new milonicMenu(". Transfer", null, "../pages/host/hostTransferSearch.jsf", "separatorsize=1;" ));
addMenu(menuSearchHost, new milonicMenu(". Deposit history", null, "../pages/host/hostDepositHistorySearch.jsf", "separatorsize=1;" ));
addMenu(menuSearchHost, new milonicMenu(". Transfer history", null, "../pages/host/hostTransferHistSearch.jsf", "separatorsize=1;" ));

var menuNewHost = new Array();
addMenu(menuNewHost, new milonicMenu(". Accounts Transaction", null, "../pages/host/hostClientTransactionAccountSearch.jsf", "separatorsize=1;" ));
addMenu(menuNewHost, new milonicMenu(". Cheque Request", null, "../pages/host/hostChequeRequestSearch.jsf", "separatorsize=1;" ));
addMenu(menuNewHost, new milonicMenu(". Cheque Request Hist", null, "../pages/host/hostChequeRequestHistSearch.jsf", "separatorsize=1;" ));

//////////////////////////S.M.Parameters Menu Credit Param/////////////////////////////
var menuCreditParam = new Array();
addMenu(menuCreditParam , new milonicMenu(". Penalties ", "menuCreditPenalties"));
addMenu(menuCreditParam , new milonicMenu(". Interest ", "menuCreditInterest"));
addMenu(menuCreditParam , new milonicMenu(". Admin ", "menuCreditAdmin"));
addMenu(menuCreditParam , new milonicMenu(". Management ", "menuCreditMangParam"));

var menuCreditPenalties = new Array();
addMenu(menuCreditPenalties, new milonicMenu(". Penalty Fee", null, "../pages/param/credit/penaltyFeesParamSearch.jsf", "separatorsize=1;" ));
addMenu(menuCreditPenalties, new milonicMenu(". Late Fee", null, "../pages/param/credit/lateFeeParamSearch.jsf", "separatorsize=1;"));
var menuCreditInterest = new Array();
addMenu(menuCreditInterest, new milonicMenu(". Definition", null, "../pages/param/credit/interestParamSearch.jsf", "separatorsize=1;" ));
addMenu(menuCreditInterest, new milonicMenu(". Mcc", null, "../pages/param/credit/interestMccParamSearch.jsf", "separatorsize=1;"));
var menuCreditAdmin = new Array();
addMenu(menuCreditAdmin, new milonicMenu(". Admin Status", null, "../pages/param/credit/AdminStatusSearch.jsf", "separatorsize=1;"));
addMenu(menuCreditAdmin, new milonicMenu(". Collateral", null, "../pages/param/credit/creditCollateralSearch.jsf", "separatorsize=1;"));
var menuCreditMangParam = new Array();
addMenu(menuCreditMangParam, new milonicMenu(". Account Management", null, "../pages/param/credit/accountManagementParamSearch.jsf", "separatorsize=1;"));
addMenu(menuCreditMangParam, new milonicMenu(". Order Clearing", null, "../pages/param/credit/OrderClearingTrxSearch.jsf", "separatorsize=1;"));
addMenu(menuCreditMangParam, new milonicMenu(". Cycle dates", null, "../pages/param/credit/cycleDatesSearch.jsf", "separatorsize=1;"));
addMenu(menuCreditMangParam, new milonicMenu(". Overdrawn fees", null, "../pages/param/credit/overdrawnFeesSearch.jsf", "separatorsize=1;"));
addMenu(menuCreditMangParam, new milonicMenu(". Transaction Param", null, "../pages/param/credit/creditTransactionParamSearch.jsf", "separatorsize=1;"));

//////////////////////////S.M.Parameters Menu Card Param/////////////////////////////
var menuCardParam = new Array();
addMenu(menuCardParam, new milonicMenu(". Range Definition", null, "../pages/param/authorization/rangeParametersSearch.jsf", "separatorsize=1;" )); 
addMenu(menuCardParam, new milonicMenu(". Product", "menuCardProduct"));

addMenu(menuCardParam , new milonicMenu(". Fees ", "menuCardFees"));
addMenu(menuCardParam , new milonicMenu(". Production ", "menuCardProduction"));
addMenu(menuCardParam , new milonicMenu(". EMV ", "menuCardEMV"));

var menuCardFees = new Array();
addMenu(menuCardFees, new milonicMenu(". Definition", null, "../pages/param/card/cardFeesSearch.jsf", "separatorsize=1;"));
addMenu(menuCardFees, new milonicMenu(". Status", null, "../pages/param/card/cardFeesStatusSearch.jsf", "separatorsize=1;" ));

var menuCardProduct = new Array();
addMenu(menuCardProduct, new milonicMenu(". Definition", null, "../pages/param/card/cardProductSearch.jsf", "separatorsize=1;"));
addMenu(menuCardProduct, new milonicMenu(". Change", null, "../pages/param/card/changeProductSearch.jsf", "separatorsize=1;" ));

var menuCardProduction = new Array();
addMenu(menuCardProduction, new milonicMenu(". Renewal Condition", null, "../pages/param/card/renewalConditionSearch.jsf", "separatorsize=1;" ));
addMenu(menuCardProduction, new milonicMenu(". Card Generation", null, "../pages/param/card/actifRangeSearch.jsf", "separatorsize=1;" ));
addMenu(menuCardProduction, new milonicMenu(". Pin Mailer", null, "../pages/param/card/pinMailerSearch.jsf", "separatorsize=1;" ));

var menuCardEMV = new Array();
addMenu(menuCardEMV, new milonicMenu(". Limits Setup", null, "../pages/param/card/emvLimitIndexSearch.jsf", "separatorsize=1;" ));
addMenu(menuCardEMV, new milonicMenu(". Cardholder Verification", null, "../pages/param/card/emvVerificationSearch.jsf", "separatorsize=1;" ));
addMenu(menuCardEMV, new milonicMenu(". Emv Parameters", null, "../pages/param/card/emvParametersSearch.jsf", "separatorsize=1;" ), "STATIC");


//////////////////////////S.M.Parameters Menu Center Param/////////////////////////////
var menuCallCenterParam = new Array();
addMenu(menuCallCenterParam, new milonicMenu(". Action", null, "../pages/param/center/callActionSearch.jsf", "separatorsize=1;" ));
addMenu(menuCallCenterParam, new milonicMenu(". Reason", null, "../pages/param/center/callReasonCardSearch.jsf", "separatorsize=1;" ));

//////////////////////////S.M.Parameters Menu Fraud Param/////////////////////////////
var menuFraudParam = new Array();
var menuFraudOn = new Array();
var menuFraudBack = new Array();
addMenu(menuFraudParam, new milonicMenu(". BackOffice", "menuFraudBack"));
//addMenu(menuFraudBack, new milonicMenu(". Customers", null, "../pages/userManagement/merchantParamSearch.jsf", "separatorsize=1;" ), "STATIC");
addMenu(menuFraudBack, new milonicMenu(". Condition Monitoring", null, "../pages/param/general/ConditionMonitoringSearch.jsf", "separatorsize=1;" ), "STATIC");
addMenu(menuFraudBack, new milonicMenu(". Mcc Excluding", null, "../pages/param/fraudeMonitoring/mccExludingSearchParam.jsf", "separatorsize=1;" ));
addMenu(menuFraudBack, new milonicMenu(". Black List Mcc", null, "../pages/param/fraudeMonitoring/blackListMccSearchParam.jsf", "separatorsize=1;" ));
addMenu(menuFraudBack, new milonicMenu(". Fraud Alertes", null, "../pages/param/fraudeMonitoring/fraudAlertesSearchParam.jsf", "separatorsize=1;" ));
addMenu(menuFraudBack, new milonicMenu(". Status Card Trx Fraud", null, "../pages/param/fraudeMonitoring/statuscCardTrxFraudSearchParam.jsf", "separatorsize=1;" ));

addMenu(menuFraudParam, new milonicMenu(". Online", "menuFraudOn"));
addMenu(menuFraudOn, new milonicMenu(". Alertes", null, "../pages/param/alert/OnlineAlertParamSearch.jsf", "separatorsize=1;" ));
addMenu(menuFraudOn, new milonicMenu(". Interface Event", null, "../pages/param/alert/InterfaceAlertSearch.jsf", "separatorsize=1;" ));
addMenu(menuFraudOn, new milonicMenu(". Event Parameter", null, "../pages/param/alert/EventAlertSearch.jsf", "separatorsize=1;" ));
addMenu(menuFraudOn, new milonicMenu(". Actions", null, "../pages/param/alert/AlertActionSearch.jsf", "separatorsize=1;" ));


//////////////////////////S.M.Parameters Menu Visa Param/////////////////////////////
var menuVisaParam = new Array();

addMenu(menuVisaParam, new milonicMenu(". Bins", null, "../pages/param/authorization/visaBinsSearch.jsf", "separatorsize=1;" ));
addMenu(menuVisaParam, new milonicMenu(". ARDEF", null, "../pages/param/authorization/visaArdefSearch.jsf", "separatorsize=1;" ));

//////////////////////////S.M.Parameters Menu MasterCard Param/////////////////////////////
var menuMasterCardParam = new Array();

addMenu(menuMasterCardParam, new milonicMenu(". Ranges", null, "../pages/param/authorization/masterCardRangesSearch.jsf", "separatorsize=1;" ));
addMenu(menuMasterCardParam, new milonicMenu(". Acquirer Bin", null, "../pages/param/authorization/masterCardAcqBinSearch.jsf", "separatorsize=1;" ));

//////////////////////////S.M.Parameters Menu General Param/////////////////////////////
var menuGeneralParam = new Array();
var menuGeneralParam2 = new Array();
var menuGeneralParamInterf = new Array();
addMenu(menuGeneralParam, new milonicMenu(". Customer", null, "../pages/userManagement/customerParamSearch.jsf", "separatorsize=1;" ));
addMenu(menuGeneralParam, new milonicMenu(". Merchant", null, "../pages/userManagement/merchantParamSearch.jsf", "separatorsize=1;" ));



//////////////////////////S.M.Parameters Menu Merchant Param/////////////////////////////
var menuMerchantParam = new Array();
addMenu(menuMerchantParam, new milonicMenu(". Management", null, "../pages/param/merchant/ManagementSearch.jsf", "separatorsize=1;" ));
addMenu(menuMerchantParam, new milonicMenu(". Comission", null, "../pages/param/merchant/MerchantCommissionSearch.jsf", "separatorsize=1;" ));
addMenu(menuMerchantParam, new milonicMenu(". Var Comission", null, "../pages/param/merchant/MerchantVarCommissionSearch.jsf", "separatorsize=1;" ));
addMenu(menuMerchantParam, new milonicMenu(". Floor Limits", null, "../pages/param/merchant/MerchantFLimitSearch.jsf", "separatorsize=1;" ));
addMenu(menuMerchantParam, new milonicMenu(". Limits", null, "../pages/param/merchant/MerchantLimitSearch.jsf", "separatorsize=1;" ));


//////////////////////////S.M.Parameters Menu Security Param/////////////////////////////
var menuSecurityParam = new Array();
addMenu(menuSecurityParam, new milonicMenu(". User Management", null, "../pages/userManagement/userParamSearch.jsf", "separatorsize=1;" ));
addMenu(menuSecurityParam, new milonicMenu(". User Menu Acces", null, "../pages/userManagement/userRoles.jsf", "separatorsize=1;" ));
addMenu(menuSecurityParam, new milonicMenu(". Group Menu Acces", null, "../pages/userManagement/groupRoles.jsf", "separatorsize=1;" ));

//////////////////////////S.M.Parameters Menu Transaction Param/////////////////////////////
var menuTransactionParam = new Array();
addMenu(menuTransactionParam, new milonicMenu(". Clearing Info", null, "../pages/param/transaction/ClearingInfoParamSearch.jsf", "separatorsize=1;" ));
addMenu(menuTransactionParam, new milonicMenu(". Network Clearing Criteria", null, "../pages/param/transaction/NetworkClearingCriteriaParamSearch.jsf", "separatorsize=1;" ));
addMenu(menuTransactionParam, new milonicMenu(". Transaction Controle", null, "../pages/param/transaction/TransactionCtrlCodeParamSearch.jsf", "separatorsize=1;" ));
addMenu(menuTransactionParam, new milonicMenu(". Matching Criteria", null, "../pages/param/transaction/MatchingParamSearch.jsf", "separatorsize=1;" ));
addMenu(menuTransactionParam, new milonicMenu(". Cardholder Fees", null, "../pages/param/transaction/CardholderFeesParamSearch.jsf", "separatorsize=1;" ));
addMenu(menuTransactionParam, new milonicMenu(". Merchant Fees", null, "../pages/param/transaction/MerchantFeesParamSearch.jsf", "separatorsize=1;" ));
addMenu(menuTransactionParam, new milonicMenu(". Value Date Calculation", null, "../pages/param/transaction/ValueDateCalParamSearch.jsf", "separatorsize=1;" ));
addMenu(menuTransactionParam, new milonicMenu(". Chargeback Reason", null, "../pages/param/transaction/ChargebackParamSearch.jsf", "separatorsize=1;" ));
addMenu(menuTransactionParam, new milonicMenu(". Potentiel Reason", null, "../pages/param/transaction/PotentielReasonParamSearch.jsf", "separatorsize=1;" ));
addMenu(menuTransactionParam, new milonicMenu(". Copy Request Reason", null, "../pages/param/transaction/CopyReqReasonParamSearch.jsf", "separatorsize=1;" ));
addMenu(menuTransactionParam, new milonicMenu(". Account Entries", null, "../pages/param/transaction/AccountingEntriesParamSearch.jsf", "separatorsize=1;" ));
addMenu(menuTransactionParam, new milonicMenu(". Transaction Type", null, "../pages/param/transaction/TransactionTypeSearch.jsf", "separatorsize=1;" ));
addMenu(menuTransactionParam, new milonicMenu(". Arn Generation", null, "../pages/param/transaction/ArnGenerationSearch.jsf", "separatorsize=1;" ));

//////////////////////////S.M.Parameters Menu Host Fees Param/////////////////////////////
var menuHostFeesParam = new Array();
addMenu(menuHostFeesParam, new milonicMenu(". Maintenance Fees", null, "../pages/param/hostFees/hostMaintenanceFeesParamSearch.jsf", "separatorsize=1;" ));
addMenu(menuHostFeesParam, new milonicMenu(". Interest Fees", null, "../pages/param/hostFees/hostInterestFeesParamSearch.jsf", "separatorsize=1;" ));

/////////////////////////// Menu Menu Credit Management ///////////////////////////
var menuCreditMng = new Array();
addMenu(menuCreditMng, new milonicMenu(". Account", null, "../pages/creditManagement/creditAccountSearch.jsf","separatorsize=1;"), "STATIC");
addMenu(menuCreditMng, new milonicMenu(". Validation", null, "../pages/creditManagement/creditForValidation.jsf","separatorsize=1;"), "STATIC");
addMenu(menuCreditMng, new milonicMenu(". Capture",  null, "../pages/creditManagement/AccountCaptureSearch.jsf","separatorsize=1;"), "STATIC");
addMenu(menuCreditMng, new milonicMenu(". Payment", "menuCreditPayment"));
addMenu(menuCreditMng, new milonicMenu(". Transaction", "menuCreditTransaction"), "STATIC");
addMenu(menuCreditMng, new milonicMenu(". Account Cancelled",null, "../pages/transaction/accountCancelledTrxSearch.jsf", "separatorsize=1;" ), "STATIC");
addMenu(menuCreditMng, new milonicMenu(". Account Online Activity",  null, "../pages/creditManagement/accountOnlineActivity.jsf","separatorsize=1;"));

/////////////////////////// Menu Menu Call center Management ///////////////////////////
var menuCallCenterMng = new Array();
addMenu(menuCallCenterMng, new milonicMenu(". Dispatching", null, "../pages/param/center/affectationCall.jsf", "separatorsize=1;"));
addMenu(menuCallCenterMng, new milonicMenu(". Tracking", null, "../pages/param/center/suiviCall.jsf", "separatorsize=1;"));
addMenu(menuCallCenterMng, new milonicMenu(". Calls capture", null, "../pages/param/center/callCardSearch.jsf", "separatorsize=1;"));

/////////////////////////// Menu Menu Card Management ///////////////////////////
var menuCreditPayment = new Array();
addMenu(menuCreditPayment , new milonicMenu(". Current", null, "../pages/creditManagement/AccountPaiement.jsf", "separatorsize=1;" ));
addMenu(menuCreditPayment , new milonicMenu(". History", null, "../pages/creditManagement/AccountPaiementHist.jsf", "separatorsize=1;" ));

/////////////////////////// Menu Menu Card Management ///////////////////////////
var menuCreditTransaction = new Array();
addMenu(menuCreditTransaction, new milonicMenu(". Current", null, "../pages/creditManagement/creditTransactionSearch.jsf","separatorsize=1;"));
addMenu(menuCreditTransaction, new milonicMenu(". History", null, "../pages/creditManagement/creditTransactionHistSearch.jsf","separatorsize=1;"));


/////////////////////////// Menu Menu Card Management ///////////////////////////
var menuCardManagement = new Array();
addMenu(menuCardManagement, new milonicMenu(". Card Update", "menuCardUpdate"));
addMenu(menuCardManagement, new milonicMenu(". Delivery Process", "menuDeliveryProcess"));
addMenu(menuCardManagement, new milonicMenu(". Emergency Process", "menuEmergencyProcess"));
var menuCardUpdate = new Array();
addMenu(menuCardUpdate, new milonicMenu(". Definition", null, "../pages/param/cardManagement/cardDataParamSearch.jsf","separatorsize=1;"));
addMenu(menuCardUpdate, new milonicMenu(". Validation", null, "../pages/param/cardManagement/cardForValidation.jsf","separatorsize=1;"));
addMenu(menuCardUpdate, new milonicMenu(". Personalisation", null, "../pages/param/cardManagement/cardPersonalization.jsf","separatorsize=1;"));
var menuDeliveryProcess = new Array();
addMenu(menuDeliveryProcess, new milonicMenu(". Card", null, "../pages/param/cardManagement/cardDeliveryProcess.jsf","separatorsize=1;"));
addMenu(menuDeliveryProcess, new milonicMenu(". Pin", null, "../pages/param/cardManagement/pinDeliveryProcess.jsf","separatorsize=1;"));
addMenu(menuCardManagement, new milonicMenu(". Charging", null, "../pages/param/cardManagement/cardChargingParamSearch.jsf","separatorsize=1;"));
var menuEmergencyProcess = new Array();
addMenu(menuEmergencyProcess, new milonicMenu(". Emergency", null, "../pages/param/emergency/cardEmergency.jsf","separatorsize=1;"));
addMenu(menuEmergencyProcess, new milonicMenu(". Error Ajustment", null, "../pages/param/emergency/cardErrorAjustement.jsf","separatorsize=1;"));

////////////////////////// Menu Merchant/////////////////////////////
var menuMerchant = new Array();
addMenu(menuMerchant, new milonicMenu(". Merchant Data", null, "../pages/param/merchant/MerchantDataParamSearch.jsf","separatorsize=1;"));
addMenu(menuMerchant, new milonicMenu(". Merchant Account", null, "../pages/param/merchant/MerchantAccountsSearch.jsf","separatorsize=1;"));
addMenu(menuMerchant, new milonicMenu(". Validation", null, "../pages/param/merchant/MerchantValidationSearch.jsf", "separatorsize=1;" ));
addMenu(menuMerchant, new milonicMenu(". Activity", null, "../pages/param/merchant/MerchantActivitySearch.jsf", "separatorsize=1;" ));
addMenu(menuMerchant, new milonicMenu(". Charging", null, "../pages/param/merchant/MerchantChargingSearch.jsf", "separatorsize=1;" ));

////////////////////////// Menu Menu Authorization/////////////////////////////
var menuAuthorization = new Array();
addMenu(menuAuthorization, new milonicMenu(". Accounts", "menuAuthorizationAccounts"));
addMenu(menuAuthorization, new milonicMenu(". Activity", "menuAuthorizationActivity"));
addMenu(menuAuthorization, new milonicMenu(". Management", "menuAuthorizationMng"));
addMenu(menuAuthorization, new milonicMenu(". Exception File", "menuExceptionFile"));
addMenu(menuAuthorization, new milonicMenu(". Autho Request",  null, "../pages/authoManagement/AuthoManual.jsf", "separatorsize=1;" ));
addMenu(menuAuthorization, new milonicMenu(". Capture",  null, "../pages/authoManagement/CaptureAutho.jsf", "separatorsize=1;" ));
var menuAuthorizationActivity = new Array();
addMenu(menuAuthorizationActivity, new milonicMenu(". Authorisation List", null, "../pages/authoManagement/authorizationLists.jsf", "separatorsize=1;" ));
addMenu(menuAuthorizationActivity, new milonicMenu(". Authorisation SAF", null, "../pages/authoManagement/authorizationSaf.jsf", "separatorsize=1;" ));
addMenu(menuAuthorizationActivity, new milonicMenu(". Authorisation SAF LOGS", null, "../pages/authoManagement/authorizationSafLogs.jsf", "separatorsize=1;" ));
addMenu(menuAuthorizationActivity, new milonicMenu(". Reconciliation", null, "../pages/authoManagement/authorizationReconciliation.jsf", "separatorsize=1;" ));
addMenu(menuAuthorizationActivity, new milonicMenu(". Card Activity", null, "../pages/param/cardManagement/cardOperationParamSearch.jsf","separatorsize=1;"));
addMenu(menuAuthorizationActivity, new milonicMenu(". Alert Data", null, "../url.jsf", "separatorsize=1;" ))

var menuAuthorizationMng = new Array();
addMenu(menuAuthorizationMng, new milonicMenu(". Monitoring", null, "../pages/authoManagement/interfacesMonitoring.jsf", "separatorsize=1;" ));
addMenu(menuAuthorizationMng, new milonicMenu(". Exploitation", null, "../pages/authoManagement/interfacesExploitation.jsf", "separatorsize=1;" ));

//////////////////////////S.M Menu Authorization Exception File/////////////////////////////
var menuExceptionFile = new Array();
addMenu(menuExceptionFile, new milonicMenu(". Visa", "menuVisaExceptionFile" ));
addMenu(menuExceptionFile, new milonicMenu(". Bank", null, "../pages/exceptionFile/bankExceptionFile.jsf", "separatorsize=1;" ));

//////////////////////////S.M Menu Authorization Exception File Visa/////////////////////////////
var menuVisaExceptionFile = new Array();
addMenu(menuVisaExceptionFile, new milonicMenu(". Region Coding", null, "../pages/exceptionFile/visaExceptionFile.jsf", "separatorsize=1;" ));
addMenu(menuVisaExceptionFile, new milonicMenu(". Risk Level", null, "../pages/exceptionFile/riskLevel.jsf", "separatorsize=1;" ));
addMenu(menuVisaExceptionFile, new milonicMenu(". Spending Limits", null, "../pages/exceptionFile/fullAuthorization.jsf", "separatorsize=1;" ));

//////////////////////////S.M Menu Authorization Accounts/////////////////////////////
var menuAuthorizationAccounts = new Array();
addMenu(menuAuthorizationAccounts, new milonicMenu(". Host Account", null, "../pages/param/accounts/AccountsStatParamSearch.jsf", "separatorsize=1;" ));
addMenu(menuAuthorizationAccounts, new milonicMenu(". Account Statistic", null, "../pages/param/accounts/standingAccountParamSearch.jsf", "separatorsize=1;" ));

////////////////////////// Menu Transaction/////////////////////////////
var menuTransaction = new Array();

addMenu(menuTransaction , new milonicMenu(". VISA", "menuVisaMng"));
var menuVisaMng= new Array();
addMenu(menuVisaMng, new milonicMenu(". Incoming Transaction", null, "../pages/transaction/IncomingVisaTransaction.jsf", "separatorsize=1;" ));
addMenu(menuVisaMng, new milonicMenu(". Incoming Historic", null, "../pages/transaction/IncomingVisaTransactionHist.jsf", "separatorsize=1;" ));

addMenu(menuTransaction , new milonicMenu(". MasterCARD", "menuMasterCMng"));

var menuMasterCMng= new Array();
addMenu(menuMasterCMng, new milonicMenu(". Incoming Transaction", null, "../pages/transaction/IncomingMasterTransaction.jsf", "separatorsize=1;" ));
addMenu(menuMasterCMng, new milonicMenu(". Incoming Historic", null, "../pages/transaction/IncomingMasterTransactionHist.jsf", "separatorsize=1;" ));
addMenu(menuTransaction , new milonicMenu(". Acquirer", "menuAcquirerMng"));

var menuAcquirerMng= new Array();
addMenu(menuAcquirerMng, new milonicMenu(". Capture", null, "../pages/transaction/CaptureSearch.jsf", "separatorsize=1;" ));
addMenu(menuAcquirerMng, new milonicMenu(". Transaction", null, "../pages/transaction/AcquirerTransaction.jsf", "separatorsize=1;" ));
addMenu(menuAcquirerMng, new milonicMenu(". Transaction Historic", null, "../pages/transaction/AcquirerTransactionHist.jsf", "separatorsize=1;" ));
addMenu(menuAcquirerMng, new milonicMenu(". Transaction Controle", null, "../pages/transaction/AcquirerTransactionControl.jsf", "separatorsize=1;" ));
addMenu(menuAcquirerMng, new milonicMenu(". Transaction Reject", null, "../pages/transaction/AcquirerTransactionReject.jsf", "separatorsize=1;" ));
addMenu(menuAcquirerMng, new milonicMenu(". Remittance Transaction",null, "../pages/transaction/AcqTransactionRemittance.jsf", "separatorsize=1;" ));
addMenu(menuAcquirerMng, new milonicMenu(". Remittance Historic",null, "../pages/transaction/AcqTransactionRemittanceHist.jsf", "separatorsize=1;" ));

addMenu(menuTransaction , new milonicMenu(". Merchant Settelement", "menuSettlemMng"));
var menuSettlemMng= new Array();
addMenu(menuSettlemMng, new milonicMenu(". Transaction", null, "../pages/transaction/MerchantTransSettlement.jsf", "separatorsize=1;" ));
addMenu(menuSettlemMng, new milonicMenu(". Transaction Historic", null, "../pages/transaction/MerchantTransSettlementHist.jsf", "separatorsize=1;" ));

addMenu(menuTransaction, new milonicMenu(". Suspect Chargeback", null, "../pages/transaction/SuspectedChargeback.jsf", "separatorsize=1;" ));


////////////////////////// Menu ChargeBack/////////////////////////////
var menuChargeBack = new Array();

addMenu(menuChargeBack , new milonicMenu(". VISA", "menuVisa"));
addMenu(menuChargeBack , new milonicMenu(". MasterCard", "menuMaster"));

var menuVisa= new Array();
addMenu(menuVisa, new milonicMenu(". ChargeBack Visa", null, "../pages/param/transaction/visaChargeBack.jsf", "separatorsize=1;" ));
addMenu(menuVisa, new milonicMenu(". CyChargeback", null, "../pages/transaction/VisaCyChargeback.jsf", "separatorsize=1;" ));
addMenu(menuVisa, new milonicMenu(". Retrieval", null, "../pages/transaction/retrievalRequest.jsf", "separatorsize=1;" ));
var menuMaster= new Array();
addMenu(menuMaster, new milonicMenu(". ChargeBack MasterCard", null, "../url.jsf", "separatorsize=1;" ));
addMenu(menuMaster, new milonicMenu(". CyChargeback", null, "../pages/transaction/MasterCyChargeback.jsf", "separatorsize=1;" ));


////////////////////////// Menu Atm/////////////////////////////
var menuAtm = new Array();
addMenu(menuAtm, new milonicMenu(". Definition", null, "../pages/param/atm/terminalSearch.jsf", "separatorsize=1;" ));
addMenu(menuAtm, new milonicMenu(". Message Porteur", null,"../pages/param/atm/messagesManagementSearch.jsf", "separatorsize=1;" ));
addMenu(menuAtm, new milonicMenu(". Suspect Transaction", null, "../pages/param/atm/suspectTransaction.jsf", "separatorsize=1;" ));
addMenu(menuAtm, new milonicMenu(". Exploitation ", "menuAtmExp"));
addMenu(menuAtm, new milonicMenu(". Activity ", "menuAtmActivity"));
addMenu(menuAtm, new milonicMenu(". Configuration Parameters", null, "../pages/param/atm/configManagementSearch.jsf", "separatorsize=1;" ));



////////////////////////// Menu Atm Exploitation/////////////////////////////

var menuAtmExp= new Array();
addMenu(menuAtmExp, new milonicMenu(". Commands Atm", null, "../pages/param/atm/command.jsf", "separatorsize=1;" ));
addMenu(menuAtmExp, new milonicMenu(". Monitoring", null, "../pages/param/atm/atmMonitoring.jsf", "separatorsize=1;" ));

////////////////////////// Menu Atm Activity/////////////////////////////

var menuAtmActivity= new Array();
addMenu(menuAtmActivity, new milonicMenu(". Atm Command", null, "../pages/param/atm/atmCommandSearch.jsf", "separatorsize=1;" ));
addMenu(menuAtmActivity, new milonicMenu(". Settlement", null, "../pages/param/atm/atmSettlementSearch.jsf", "separatorsize=1;" ));
addMenu(menuAtmActivity, new milonicMenu(". Situation", null, "../pages/param/atm/atmActivitySearch.jsf", "separatorsize=1;" ));
addMenu(menuAtmActivity, new milonicMenu(". Status History", null, "../pages/param/atm/alertHistSearch.jsf", "separatorsize=1;" ));

////////////////////////// Menu Menu Pos/////////////////////////////
var menuPos = new Array();
addMenu(menuPos, new milonicMenu(". Terminal", null, "../pages/param/merchant/PosTerminalSearch.jsf", "separatorsize=1;" ));
addMenu(menuPos, new milonicMenu(". Reconciliation", null, "../pages/param/merchant/PosTerminalReconSearch.jsf", "separatorsize=1;" ));
addMenu(menuPos, new milonicMenu(". Collection", null, "../pages/param/merchant/PosTerminalCollectSearch.jsf", "separatorsize=1;" ));
addMenu(menuPos, new milonicMenu(". Stop List", null, "../pages/param/merchant/StopListPos.jsf", "separatorsize=1;" ));

////////////////////////// Menu Risk/////////////////////////////
var menuRisk = new Array();
addMenu(menuRisk , new milonicMenu(". Stop/With Card", "menuStopLisCMng"));
addMenu(menuRisk , new milonicMenu(". Stop/With Range", "menuStopLisRMng"));
addMenu(menuRisk , new milonicMenu(". Stop/With Bin", "menuStopLisBMng"));
addMenu(menuRisk , new milonicMenu(". Network Stop List", null, "../pages/param/riskManagement/networkStopListSearch.jsf", "separatorsize=1;" ));
addMenu(menuRisk , new milonicMenu(". Historic", "menuStopLisHist"));
addMenu(menuRisk , new milonicMenu(". EMV Script ", "menuCardScriptMng"));


////////////////////////// Menu Stop List/////////////////////////////
var menuStopLisCMng= new Array();
addMenu(menuStopLisCMng, new milonicMenu(". Card ", null, "../pages/param/riskManagement/cardStoppedSearchParam.jsf", "separatorsize=1;" ));
addMenu(menuStopLisCMng, new milonicMenu(". Merchant Mcc", null, "../pages/param/riskManagement/cardStopMerchantMccSearch.jsf", "separatorsize=1;" ));
addMenu(menuStopLisCMng, new milonicMenu(". Country", null, "../pages/param/riskManagement/cardStopCountrySearch.jsf", "separatorsize=1;" ));

////////////////////////// Menu Stop List/////////////////////////////
var menuStopLisRMng= new Array();
addMenu(menuStopLisRMng, new milonicMenu(". Card Range ", null, "../pages/param/riskManagement/rangeStoppedSearchParam.jsf", "separatorsize=1;" ));
addMenu(menuStopLisRMng, new milonicMenu(". Merchant Mcc", null, "../pages/param/riskManagement/rangeStopMerchantMccSearch.jsf", "separatorsize=1;" ));
addMenu(menuStopLisRMng, new milonicMenu(". Country", null, "../pages/param/riskManagement/rangeStopCountrySearch.jsf", "separatorsize=1;" ));

////////////////////////// Menu Stop List/////////////////////////////
var menuStopLisBMng= new Array();
addMenu(menuStopLisBMng, new milonicMenu(". Card Bin ", null, "../pages/param/riskManagement/binStoppedSearchParam.jsf", "separatorsize=1;" ));
addMenu(menuStopLisBMng, new milonicMenu(". Merchant Mcc", null, "../pages/param/riskManagement/binStopMerchantMccSearch.jsf", "separatorsize=1;" ));
addMenu(menuStopLisBMng, new milonicMenu(". Country", null, "../pages/param/riskManagement/binStopCountrySearch.jsf", "separatorsize=1;" ));

////////////////////////// Menu Stop List/////////////////////////////
var menuStopLisHist= new Array();
addMenu(menuStopLisHist, new milonicMenu(". Card ", null, "../pages/param/riskManagement/stopListHistoryCardSearch.jsf", "separatorsize=1;" ));
addMenu(menuStopLisHist, new milonicMenu(". Bin", null, "../pages/param/riskManagement/stopListHistoryBinSearch.jsf", "separatorsize=1;" ));
addMenu(menuStopLisHist, new milonicMenu(". Range", null, "../pages/param/riskManagement/stopListHistoryRangeSearch.jsf", "separatorsize=1;" ));

////////////////////////// Menu EMV Script/////////////////////////////
var menuCardScriptMng= new Array();
addMenu(menuCardScriptMng, new milonicMenu(". Definition ", null, "../pages/param/riskManagement/emvScriptDefinitionSearch.jsf", "separatorsize=1;" ));
addMenu(menuCardScriptMng, new milonicMenu(". Management ", "menuCardScriptMngByEntity" ));
addMenu(menuCardScriptMng, new milonicMenu(". Historic ", null, "../pages/param/riskManagement/emvScriptStatusSearch.jsf", "separatorsize=1;" ));

////////////////////////// Menu EMV Script Management/////////////////////////////
var menuCardScriptMngByEntity= new Array();
addMenu(menuCardScriptMngByEntity, new milonicMenu(". Card ", null, "../pages/param/riskManagement/emvScriptByCard.jsf", "separatorsize=1;" ));
addMenu(menuCardScriptMngByEntity, new milonicMenu(". Product ", null, "../pages/param/riskManagement/emvScriptByProduct.jsf", "separatorsize=1;" ));

////////////////////////// Menu Batch/////////////////////////////
var menuBatch = new Array();
addMenu(menuBatch , new milonicMenu(". BATCH", "menuBatchs"));
var menuBatchs= new Array();
addMenu(menuBatchs, new milonicMenu(". Group", null, "../pages/batch/batchGroupSearch.jsf", "separatorsize=1;" ));
addMenu(menuBatchs, new milonicMenu(". Definition", null, "../pages/batch/batchDetailsSearch.jsf", "separatorsize=1;" ));
addMenu(menuBatchs, new milonicMenu(". Processing ", null, "../pages/batch/batchProcessing.jsf", "separatorsize=1;" ));

addMenu(menuBatch , new milonicMenu(". REPORTING", "menuReporting"));
var menuReporting= new Array();
addMenu(menuReporting, new milonicMenu(". Group ", null,"../pages/batch/ReportGroupSearch.jsf", "separatorsize=1;" ));
addMenu(menuReporting, new milonicMenu(". Definition", null, "../pages/batch/ReportDetailsSearch.jsf", "separatorsize=1;" ));
addMenu(menuReporting, new milonicMenu(". User  ", null,"../pages/batch/ReportUserGroupSearch.jsf", "separatorsize=1;" ));
addMenu(menuReporting, new milonicMenu(". Batch  ", null,"../pages/batch/ReportBatchGroupSearch.jsf", "separatorsize=1;" ));  
addMenu(menuReporting, new milonicMenu(". Processing ", null,"../pages/batch/ReportProcessing.jsf", "separatorsize=1;" ));
addMenu(menuReporting, new milonicMenu(". Dynamic", null, "../pages/batch/dynamicReport.jsf", "separatorsize=1;" ));

addMenu(menuBatch , new milonicMenu(". CUT OFF", null, "../pages/batch/CutOff.jsf", "separatorsize=1;" ));

////////////////////////// Menu Admin Management/////////////////////////////
var menuAdminManagement = new Array();
addMenu(menuAdminManagement, new milonicMenu(". Security", "menuAdminManagementSecurity"));
addMenu(menuAdminManagement, new milonicMenu(". Traces Application", null, "../pages/adminManagement/application_traces.jsf", "separatorsize=1;" ));
addMenu(menuAdminManagement, new milonicMenu(". Paths Application", null, "../pages/adminManagement/application_paths.jsf", "separatorsize=1;" ));

//////////////////////////S.M Menu Admin Management Menu Security/////////////////////////////
var menuAdminManagementSecurity = new Array();
addMenu(menuAdminManagementSecurity, new milonicMenu(". User Operation", null, "../pages/param/welcomPage/historyUserOpeartionSearch.jsf", "separatorsize=1;" ));

//////////////////////////    /////////////////////////////
var menuStatistic = new Array();
addMenu(menuStatistic, new milonicMenu(". Acquirer ", null, "../url.jsf", "separatorsize=1;" ));
addMenu(menuStatistic, new milonicMenu(". Issuer", null, "../url.jsf", "separatorsize=1;" ));

/////////////////////////// Menu Aide /////////////////////////////
var menuHelp = new Array();
addMenu(menuHelp, new milonicMenu(". Help OnLine", null, "javascript:helpModeFunction();"), "STATIC");
addMenu(menuHelp, new milonicMenu(". Show Error", null, "../url.jsf", "separatorsize=1;" ), "STATIC");
addMenu(menuHelp, new milonicMenu(". About BITS", null, "../url.jsf", "separatorsize=1;" ), "STATIC");

/////////////////////////// Menu Utility /////////////////////////////
var menuUtilityMng = new Array();
addMenu(menuUtilityMng, new milonicMenu(". Memo", null, "../pages/param/welcomPage/epsMemosSearch.jsf", "separatorsize=1;" ));
addMenu(menuUtilityMng, new milonicMenu(". Planning", null,  "../pages/param/welcomPage/epsPlanningSearch.jsf", "separatorsize=1;" ));
addMenu(menuUtilityMng, new milonicMenu(". Admin Message", null, "../pages/param/welcomPage/epsAdministrationMessageSearch.jsf", "separatorsize=1;" ));
///////////////////////////////////////////////////////////////////////

_menuCloseDelay=500           // The time delay for menus to remain visible on mouse out
_menuOpenDelay=150            // The time delay before menus open on mouse over
_subOffsetTop=10             // Sub menu top offset
_subOffsetLeft=-10            // Sub menu left offset

//test commentaire

with(menuStyle=new mm_style()){
onbgcolor="#E99E43";
oncolor="#ffffff";
offbgcolor="#40668C";
offcolor="#ffffff";
bordercolor="#40668C";
borderstyle="solid";
borderwidth=1;
separatorcolor="#ffffff";
separatorsize="1";
padding=5;
fontsize="12px";
fontstyle="normal";
fontfamily="Verdana, Tahoma, Arial";
pagecolor="black";
pagebgcolor="#82B6D7";
headercolor="#000000";
headerbgcolor="#ffffff";
subimage="/MBANK/charte/images/arrow.gif";
subimagepadding="2";
openonclick=1;
//overfilter="Fade(duration=0.2);Alpha(opacity=90);Shadow(color='#777777', Direction=135, Strength=5)";
//outfilter="randomdissolve(duration=0.3)";
}


with(menuStyleLevel1=new mm_style()){
onbgcolor="#E99E43";
oncolor="#006699";
offbgcolor="#D1DAE3";
offcolor="#006699";
bordercolor="#296488";
borderstyle="solid";
borderwidth=1;
separatorcolor="#006699";
separatorsize="0";
padding=5;
fontsize="10px";
fontstyle="normal";
fontfamily="Verdana, Tahoma, Arial";
pagecolor="black";
pagebgcolor="#82B6D7";
headercolor="#000000";
headerbgcolor="#ffffff";
subimage="/MBANK/charte/images/arrow.gif";
subimagepadding="2";
//overfilter="Fade(duration=0.2);Alpha(opacity=90);Shadow(color='#777777', Direction=135, Strength=5)";
}


with(menuStyleLevel2=new mm_style()){
onbgcolor="#E99E43";
oncolor="#006699";
offbgcolor="#D1DAE3";
offcolor="#006699";
bordercolor="#296488";
borderstyle="solid";
borderwidth=1;
separatorcolor="#006699";
separatorsize="0";
padding=5;
fontsize="10px";
fontstyle="normal";
fontfamily="Verdana, Tahoma, Arial";
pagecolor="black";
pagebgcolor="#82B6D7";
headercolor="#000000";
headerbgcolor="#ffffff";
subimage="/MBANK/charte/images/arrow.gif";
subimagepadding="2";
}

with(menuStyleLevel3=new mm_style()){
onbgcolor="#E99E43";
oncolor="#006699";
offbgcolor="#D1DAE3";
offcolor="#006699";
bordercolor="#296488";
borderstyle="solid";
borderwidth=1;
separatorcolor="#006699";
separatorsize="0";
padding=5;
fontsize="10px";
fontstyle="normal";
fontfamily="Verdana, Tahoma, Arial";
pagecolor="black";
pagebgcolor="#82B6D7";
headercolor="#000000";
headerbgcolor="#ffffff";
subimage="/MBANK/charte/images/arrow.gif";
subimagepadding="2";
}
with(menuStyleLevel4=new mm_style()){
onbgcolor="#E99E43";
oncolor="#006699";
offbgcolor="#D1DAE3";
offcolor="#006699";
bordercolor="#296488";
borderstyle="solid";
borderwidth=1;
separatorcolor="#006699";
separatorsize="0";
padding=5;
fontsize="10px";
fontstyle="normal";
fontfamily="Verdana, Tahoma, Arial";
pagecolor="black";
pagebgcolor="#82B6D7";
headercolor="#000000";
headerbgcolor="#ffffff";
subimage="/MBANK/charte/images/arrow.gif";
subimagepadding="2";
}
