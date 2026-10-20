import 'package:food_doctor/core/l10n/app_language.dart';

/// UI copy for English and Burmese.
class AppStrings {
  const AppStrings._(this._values);

  final Map<String, String> _values;

  String _t(String key) => _values[key] ?? key;

  static AppStrings of(AppLanguage language) {
    return AppStrings._(language == AppLanguage.burmese ? _my : _en);
  }

  // Navigation
  String get navHome => _t('navHome');
  String get navCatalog => _t('navCatalog');
  String get navMaterials => _t('navMaterials');
  String get navExperts => _t('navExperts');
  String get navProfile => _t('navProfile');
  String get back => _t('back');

  // Home
  String get goodMorning => _t('goodMorning');
  String get productName => _t('productName');
  String get scopeLabel => _t('scopeLabel');
  String get modules => _t('modules');
  String get loggedIn => _t('loggedIn');
  String get roleUserEcommerce => _t('roleUserEcommerce');
  String get quickStart => _t('quickStart');
  String get quickStartTitle => _t('quickStartTitle');
  String get quickStartBody => _t('quickStartBody');
  String get notifications => _t('notifications');

  String get moduleKnowledge => _t('moduleKnowledge');
  String get moduleKnowledgeSub => _t('moduleKnowledgeSub');
  String get moduleBlog => _t('moduleBlog');
  String get moduleBlogSub => _t('moduleBlogSub');
  String get moduleMaterials => _t('moduleMaterials');
  String get moduleMaterialsSub => _t('moduleMaterialsSub');
  String get moduleConsultants => _t('moduleConsultants');
  String get moduleConsultantsSub => _t('moduleConsultantsSub');
  String get moduleJobs => _t('moduleJobs');
  String get moduleJobsSub => _t('moduleJobsSub');
  String get moduleIndustrial => _t('moduleIndustrial');
  String get moduleIndustrialSub => _t('moduleIndustrialSub');
  String get moduleMyRecords => _t('moduleMyRecords');
  String get moduleMyRecordsSub => _t('moduleMyRecordsSub');

  // Catalog
  String get knowledgeCatalog => _t('knowledgeCatalog');
  String get foodCategories => _t('foodCategories');
  String get advancedSearch => _t('advancedSearch');
  String get category => _t('category');
  String get capacity => _t('capacity');
  String get typeOfKnowledge => _t('typeOfKnowledge');
  String get search => _t('search');
  String get select => _t('select');
  String get sizeOfBusiness => _t('sizeOfBusiness');
  String get knowledgeList => _t('knowledgeList');
  String get knowledge => _t('knowledge');
  String get free => _t('free');
  String get paid => _t('paid');
  String get included => _t('included');
  String get purchase => _t('purchase');
  String get purchaseMessage => _t('purchaseMessage');
  String get checkOut => _t('checkOut');
  String get shopMore => _t('shopMore');
  String get navigationVideo => _t('navigationVideo');
  String get navigationVideoBody => _t('navigationVideoBody');
  String get starter => _t('starter');
  String get smallPlant => _t('smallPlant');
  String get factory => _t('factory');

  // Blog
  String get blog => _t('blog');
  String get blogSubtitle => _t('blogSubtitle');
  String get updates => _t('updates');
  String get featured => _t('featured');
  String get previous => _t('previous');
  String get next => _t('next');
  String get pageOf => _t('pageOf');
  String get backToListing => _t('backToListing');
  String get previousArticle => _t('previousArticle');
  String get nextArticle => _t('nextArticle');

  // Materials
  String get materialsMachinery => _t('materialsMachinery');
  String get materialsSubtitle => _t('materialsSubtitle');
  String get rawMaterial => _t('rawMaterial');
  String get packaging => _t('packaging');
  String get machinery => _t('machinery');
  String get searchThisTab => _t('searchThisTab');
  String get items => _t('items');
  String get inquiry => _t('inquiry');
  String get hotLine => _t('hotLine');
  String get yourQuestion => _t('yourQuestion');
  String get inquiryMore => _t('inquiryMore');
  String get sendInquiry => _t('sendInquiry');

  // Industrial / Experts / Jobs
  String get industrialDirectory => _t('industrialDirectory');
  String get suppliersAtoZ => _t('suppliersAtoZ');
  String get additive => _t('additive');
  String get searchNamePhoneKeyword => _t('searchNamePhoneKeyword');
  String get experts => _t('experts');
  String get profilesAndInquiry => _t('profilesAndInquiry');
  String get consultant => _t('consultant');
  String get articles => _t('articles');
  String get jobOpportunities => _t('jobOpportunities');
  String get foodIndustryCareers => _t('foodIndustryCareers');
  String get salaryRange => _t('salaryRange');
  String get contact => _t('contact');
  String get open => _t('open');
  String get closed => _t('closed');

  // Profile / Auth
  String get profile => _t('profile');
  String get profileSubtitle => _t('profileSubtitle');
  String get language => _t('language');
  String get languageSubtitle => _t('languageSubtitle');
  String get accountInformation => _t('accountInformation');
  String get resetPassword => _t('resetPassword');
  String get myKnowledgeAssets => _t('myKnowledgeAssets');
  String get myInquiry => _t('myInquiry');
  String get saveAccount => _t('saveAccount');
  String get updatePassword => _t('updatePassword');
  String get signOut => _t('signOut');
  String get signIn => _t('signIn');
  String get createAccount => _t('createAccount');
  String get register => _t('register');
  String get forgotPassword => _t('forgotPassword');
  String get rememberPassword => _t('rememberPassword');
  String get welcomeBack => _t('welcomeBack');
  String get accountAccess => _t('accountAccess');
  String get loginSubtitle => _t('loginSubtitle');
  String get usernameEmail => _t('usernameEmail');
  String get noAccount => _t('noAccount');
  String get adminApprovalNote => _t('adminApprovalNote');
  String get telephone => _t('telephone');
  String get password => _t('password');
  String get capture => _t('capture');
  String get name => _t('name');
  String get email => _t('email');
  String get address => _t('address');
  String get nameOfBusiness => _t('nameOfBusiness');
  String get currentPosition => _t('currentPosition');
  String get typeOfBusiness => _t('typeOfBusiness');
  String get manufacturedProduct => _t('manufacturedProduct');
  String get confirmedPassword => _t('confirmedPassword');
  String get oldPassword => _t('oldPassword');
  String get newPassword => _t('newPassword');
  String get submit => _t('submit');
  String get purchased => _t('purchased');
  String get roleLabel => _t('roleLabel');

  // Cart / Inquiry / Notifications
  String get cartEmpty => _t('cartEmpty');
  String get cartEmptyBody => _t('cartEmptyBody');
  String get knowledgePurchase => _t('knowledgePurchase');
  String get total => _t('total');
  String get clearCart => _t('clearCart');
  String get confirmPurchase => _t('confirmPurchase');
  String get payWithMmqr => _t('payWithMmqr');
  String get mmqrMessage => _t('mmqrMessage');
  String get done => _t('done');
  String get materialInquiry => _t('materialInquiry');
  String get noInquiryYet => _t('noInquiryYet');
  String get noInquiryYetBody => _t('noInquiryYetBody');
  String get confirmInquiry => _t('confirmInquiry');
  String get inquirySent => _t('inquirySent');
  String get inquirySentBody => _t('inquirySentBody');
  String get notificationsTitle => _t('notificationsTitle');
  String get notificationsSubtitle => _t('notificationsSubtitle');
  String get accountApproved => _t('accountApproved');
  String get accountApprovedBody => _t('accountApprovedBody');
  String get passwordResetLink => _t('passwordResetLink');
  String get passwordResetLinkBody => _t('passwordResetLinkBody');
  String get paymentConfirmation => _t('paymentConfirmation');
  String get paymentConfirmationBody => _t('paymentConfirmationBody');

  // Common empty / status
  String get notFound => _t('notFound');
  String get close => _t('close');

  static const _en = <String, String>{
    'navHome': 'Home',
    'navCatalog': 'Catalog',
    'navMaterials': 'Materials',
    'navExperts': 'Experts',
    'navProfile': 'Profile',
    'back': 'Back',
    'goodMorning': 'GOOD MORNING',
    'productName': 'Food Doctor',
    'scopeLabel': '7 scopes',
    'modules': 'Modules',
    'loggedIn': 'Logged in',
    'roleUserEcommerce': 'Role: User · E-commerce',
    'quickStart': 'QUICK START',
    'quickStartTitle': 'Build your food product path',
    'quickStartBody':
        'Browse business types → size → functionalities → unlock knowledge after purchase.',
    'notifications': 'Notifications',
    'moduleKnowledge': 'Knowledge Catalog',
    'moduleKnowledgeSub': '49 business types · Buy access',
    'moduleBlog': 'Blog',
    'moduleBlogSub': 'Video, PDF, audio & more',
    'moduleMaterials': 'Materials & Machinery',
    'moduleMaterialsSub': 'Chemical raw materials',
    'moduleConsultants': 'Consultants',
    'moduleConsultantsSub': 'Expert profiles · Inquiry',
    'moduleJobs': 'Job Opportunities',
    'moduleJobsSub': 'Food industry careers',
    'moduleIndustrial': 'Industrial Directory',
    'moduleIndustrialSub': 'Suppliers & manufacturers',
    'moduleMyRecords': 'My Knowledge / My Inquiries',
    'moduleMyRecordsSub': 'Purchased knowledge · Inquiries',
    'knowledgeCatalog': 'Knowledge Catalog',
    'foodCategories': 'Food categories',
    'advancedSearch': 'Advanced search',
    'category': 'Category',
    'capacity': 'Capacity',
    'typeOfKnowledge': 'Type of knowledge',
    'search': 'Search',
    'select': 'Select',
    'sizeOfBusiness': 'Size of the business',
    'knowledgeList': 'Knowledge list',
    'knowledge': 'Knowledge',
    'free': 'Free',
    'paid': 'Paid',
    'included': 'Included',
    'purchase': 'Purchase',
    'purchaseMessage':
        'Check out now, or shop more. The selected knowledge stays in the cart.',
    'checkOut': 'Check out',
    'shopMore': 'Shop more',
    'navigationVideo': 'Navigation video',
    'navigationVideoBody':
        'A short walkthrough for this step will play here.',
    'starter': 'Starter',
    'smallPlant': 'Small plant',
    'factory': 'Factory',
    'blog': 'Blog',
    'blogSubtitle': 'Updates and featured articles',
    'updates': 'Updates',
    'featured': 'Featured',
    'previous': 'Previous',
    'next': 'Next',
    'pageOf': 'Page {current} of {total}',
    'backToListing': 'Back to listing',
    'previousArticle': 'Previous article',
    'nextArticle': 'Next article',
    'materialsMachinery': 'Materials & Machinery',
    'materialsSubtitle': 'Raw, packaging, and machinery',
    'rawMaterial': 'Raw material',
    'packaging': 'Packaging',
    'machinery': 'Machinery',
    'searchThisTab': 'Search this tab',
    'items': 'Items',
    'inquiry': 'Inquiry',
    'hotLine': 'Hot line',
    'yourQuestion': 'Your question',
    'inquiryMore': 'Inquiry more',
    'sendInquiry': 'Send inquiry',
    'industrialDirectory': 'Industrial Directory',
    'suppliersAtoZ': 'Suppliers, A to Z',
    'additive': 'Additive',
    'searchNamePhoneKeyword': 'Search name, phone, or keyword',
    'experts': 'Experts',
    'profilesAndInquiry': 'Profiles and inquiry',
    'consultant': 'Consultant',
    'articles': 'Articles',
    'jobOpportunities': 'Job Opportunities',
    'foodIndustryCareers': 'Food industry careers',
    'salaryRange': 'Salary range',
    'contact': 'Contact',
    'open': 'Open',
    'closed': 'Closed',
    'profile': 'Profile',
    'profileSubtitle': 'Account, knowledge, and inquiries',
    'language': 'Language',
    'languageSubtitle': 'English / မြန်မာ',
    'accountInformation': 'Account information',
    'resetPassword': 'Reset password',
    'myKnowledgeAssets': 'My Knowledge Assets',
    'myInquiry': 'My Inquiry',
    'saveAccount': 'Save account',
    'updatePassword': 'Update password',
    'signOut': 'Sign out',
    'signIn': 'Sign In',
    'createAccount': 'Create an account',
    'register': 'Register',
    'forgotPassword': 'Forgot password?',
    'rememberPassword': 'Remember password',
    'welcomeBack': 'Welcome back',
    'accountAccess': 'ACCOUNT ACCESS',
    'loginSubtitle':
        'Sign in to browse catalogs, directories, and appointments.',
    'usernameEmail': 'Username / Email',
    'noAccount': 'No account? ',
    'adminApprovalNote':
        'A new account can be used after an administrator approves it.',
    'telephone': 'Telephone',
    'password': 'Password',
    'capture': 'Capture',
    'name': 'Name',
    'email': 'Email',
    'address': 'Address',
    'nameOfBusiness': 'Name of business',
    'currentPosition': 'Current position',
    'typeOfBusiness': 'Type of business',
    'manufacturedProduct': 'Manufactured product',
    'confirmedPassword': 'Confirmed password',
    'oldPassword': 'Old password',
    'newPassword': 'New password',
    'submit': 'Submit',
    'purchased': 'Purchased',
    'roleLabel': 'Role: {position} · {type}',
    'cartEmpty': 'Cart is empty',
    'cartEmptyBody': 'Shop from the knowledge catalog to add a paid item.',
    'knowledgePurchase': 'Knowledge purchase',
    'total': 'Total',
    'clearCart': 'Clear cart',
    'confirmPurchase': 'Confirm purchase',
    'payWithMmqr': 'Pay with MMQR',
    'mmqrMessage':
        'After you pay, send the screenshot to Viber 0900000. The receipt is confirmed within 24 hours and you will be contacted by SMS. Thank you.',
    'done': 'Done',
    'materialInquiry': 'Material inquiry',
    'noInquiryYet': 'No inquiry yet',
    'noInquiryYetBody':
        'Choose a raw material, packaging item, or machine and write a question.',
    'confirmInquiry': 'Confirm inquiry',
    'inquirySent': 'Inquiry sent',
    'inquirySentBody':
        'The raw materials, packaging, and machinery and spare parts have been sent to the administrator.',
    'notificationsTitle': 'Notifications',
    'notificationsSubtitle': 'Approval, reset, and payment',
    'accountApproved': 'Account approved',
    'accountApprovedBody':
        'Your Food Doctor account can be used. This is the SMS an administrator sends after approval.',
    'passwordResetLink': 'Password reset link',
    'passwordResetLinkBody':
        'A reset link was sent to the telephone and email on the account.',
    'paymentConfirmation': 'Payment confirmation',
    'paymentConfirmationBody':
        'A receipt was confirmed. The purchased knowledge is now in My Knowledge.',
    'notFound': 'Not found',
    'close': 'Close',
  };

  static const _my = <String, String>{
    'navHome': 'ပင်မ',
    'navCatalog': 'ကတ်တလော့',
    'navMaterials': 'ကုန်ကြမ်း',
    'navExperts': 'ကျွမ်းကျင်သူ',
    'navProfile': 'ပရိုဖိုင်',
    'back': 'နောက်သို့',
    'goodMorning': 'မင်္ဂလာနံနက်ခင်းပါ',
    'productName': 'Food Doctor',
    'scopeLabel': '၇ ခု',
    'modules': 'မော်ဂျူးများ',
    'loggedIn': 'ဝင်ရောက်ပြီး',
    'roleUserEcommerce': 'အခန်းကဏ္ဍ: အသုံးပြုသူ · E-commerce',
    'quickStart': 'အမြန်စတင်ရန်',
    'quickStartTitle': 'အစားအသောက်ထုတ်ကုန်လမ်းကြောင်း တည်ဆောက်ပါ',
    'quickStartBody':
        'လုပ်ငန်းအမျိုးအစား → အရွယ်အစား → လုပ်ဆောင်ချက်များ → ဝယ်ယူပြီးနောက် အသိပညာဖွင့်ရန်။',
    'notifications': 'အသိပေးချက်များ',
    'moduleKnowledge': 'အသိပညာကတ်တလော့',
    'moduleKnowledgeSub': 'လုပ်ငန်းအမျိုးအစား ၄၉ · ဝယ်ယူရန်',
    'moduleBlog': 'ဘလော့',
    'moduleBlogSub': 'ဗီဒီယို၊ PDF၊ အသံနှင့် အခြား',
    'moduleMaterials': 'ကုန်ကြမ်းနှင့် စက်ပစ္စည်း',
    'moduleMaterialsSub': 'ဓာတုကုန်ကြမ်းများ',
    'moduleConsultants': 'အကြံပေးများ',
    'moduleConsultantsSub': 'ပရိုဖိုင် · မေးမြန်းရန်',
    'moduleJobs': 'အလုပ်အကိုင်အခွင့်အလမ်း',
    'moduleJobsSub': 'အစားအသောက်လုပ်ငန်း အလုပ်များ',
    'moduleIndustrial': 'စက်မှုလုပ်ငန်း လိပ်စာစာရင်း',
    'moduleIndustrialSub': 'ပေးသွင်းသူနှင့် ထုတ်လုပ်သူများ',
    'moduleMyRecords': 'ကျွန်ုပ်၏ အသိပညာ / မေးခွန်းများ',
    'moduleMyRecordsSub': 'ဝယ်ယူထားသော အသိပညာ · မေးခွန်းများ',
    'knowledgeCatalog': 'အသိပညာကတ်တလော့',
    'foodCategories': 'အစားအသောက်အမျိုးအစားများ',
    'advancedSearch': 'အဆင့်မြင့်ရှာဖွေမှု',
    'category': 'အမျိုးအစား',
    'capacity': 'စွမ်းရည်',
    'typeOfKnowledge': 'အသိပညာအမျိုးအစား',
    'search': 'ရှာရန်',
    'select': 'ရွေးချယ်ရန်',
    'sizeOfBusiness': 'လုပ်ငန်းအရွယ်အစား',
    'knowledgeList': 'အသိပညာစာရင်း',
    'knowledge': 'အသိပညာ',
    'free': 'အခမဲ့',
    'paid': 'အခပေး',
    'included': 'ပါဝင်ပြီး',
    'purchase': 'ဝယ်ယူရန်',
    'purchaseMessage':
        'ယခုငွေချေပါ၊ သို့မဟုတ် ထပ်မံရွေးပါ။ ရွေးထားသော အသိပညာသည် ခြင်းတောင်းတွင် ကျန်ရှိပါမည်။',
    'checkOut': 'ငွေချေရန်',
    'shopMore': 'ထပ်မံရွေးရန်',
    'navigationVideo': 'လမ်းညွှန်ဗီဒီယို',
    'navigationVideoBody': 'ဤအဆင့်အတွက် အတိုချုံးလမ်းညွှန်ကို ဤနေရာတွင် ဖွင့်ပြပါမည်။',
    'starter': 'အစပိုင်း',
    'smallPlant': 'စက်ရုံငယ်',
    'factory': 'စက်ရုံ',
    'blog': 'ဘလော့',
    'blogSubtitle': 'အပ်ဒိတ်နှင့် အထူးဆောင်းပါးများ',
    'updates': 'အပ်ဒိတ်',
    'featured': 'အထူး',
    'previous': 'ယခင်',
    'next': 'နောက်',
    'pageOf': 'စာမျက်နှာ {current} / {total}',
    'backToListing': 'စာရင်းသို့ ပြန်ရန်',
    'previousArticle': 'ယခင်ဆောင်းပါး',
    'nextArticle': 'နောက်ဆောင်းပါး',
    'materialsMachinery': 'ကုန်ကြမ်းနှင့် စက်ပစ္စည်း',
    'materialsSubtitle': 'ကုန်ကြမ်း၊ ထုပ်ပိုးမှုနှင့် စက်များ',
    'rawMaterial': 'ကုန်ကြမ်း',
    'packaging': 'ထုပ်ပိုးမှု',
    'machinery': 'စက်ပစ္စည်း',
    'searchThisTab': 'ဤတက်ဘ်တွင် ရှာရန်',
    'items': 'ပစ္စည်းများ',
    'inquiry': 'မေးမြန်းရန်',
    'hotLine': 'ဟော့လိုင်း',
    'yourQuestion': 'သင့်မေးခွန်း',
    'inquiryMore': 'ထပ်မံမေးမြန်းရန်',
    'sendInquiry': 'မေးခွန်းပို့ရန်',
    'industrialDirectory': 'စက်မှုလုပ်ငန်း လိပ်စာစာရင်း',
    'suppliersAtoZ': 'ပေးသွင်းသူများ၊ က မှ အ',
    'additive': 'ဖြည့်စွက်ပစ္စည်း',
    'searchNamePhoneKeyword': 'အမည်၊ ဖုန်း သို့မဟုတ် သော့ချက်စာလုံး ရှာရန်',
    'experts': 'ကျွမ်းကျင်သူများ',
    'profilesAndInquiry': 'ပရိုဖိုင်နှင့် မေးမြန်းမှု',
    'consultant': 'အကြံပေး',
    'articles': 'ဆောင်းပါးများ',
    'jobOpportunities': 'အလုပ်အကိုင်အခွင့်အလမ်း',
    'foodIndustryCareers': 'အစားအသောက်လုပ်ငန်း အလုပ်များ',
    'salaryRange': 'လစာအပိုင်းအခြား',
    'contact': 'ဆက်သွယ်ရန်',
    'open': 'ဖွင့်',
    'closed': 'ပိတ်',
    'profile': 'ပရိုဖိုင်',
    'profileSubtitle': 'အကောင့်၊ အသိပညာနှင့် မေးခွန်းများ',
    'language': 'ဘာသာစကား',
    'languageSubtitle': 'English / မြန်မာ',
    'accountInformation': 'အကောင့်အချက်အလက်',
    'resetPassword': 'စကားဝှက်ပြောင်းရန်',
    'myKnowledgeAssets': 'ကျွန်ုပ်၏ အသိပညာများ',
    'myInquiry': 'ကျွန်ုပ်၏ မေးခွန်းများ',
    'saveAccount': 'အကောင့်သိမ်းရန်',
    'updatePassword': 'စကားဝှက်အပ်ဒိတ်',
    'signOut': 'ထွက်ရန်',
    'signIn': 'ဝင်ရောက်ရန်',
    'createAccount': 'အကောင့်ဖွင့်ရန်',
    'register': 'မှတ်ပုံတင်ရန်',
    'forgotPassword': 'စကားဝှက်မေ့နေပါသလား?',
    'rememberPassword': 'စကားဝှက်မှတ်ထားရန်',
    'welcomeBack': 'ပြန်လည်ကြိုဆိုပါသည်',
    'accountAccess': 'အကောင့်ဝင်ရောက်မှု',
    'loginSubtitle':
        'ကတ်တလော့များ၊ လမ်းညွှန်များနှင့် ချိန်းဆိုမှုများကို ကြည့်ရန် ဝင်ရောက်ပါ။',
    'usernameEmail': 'အသုံးပြုသူအမည် / အီးမေးလ်',
    'noAccount': 'အကောင့်မရှိသေးဘူးလား? ',
    'adminApprovalNote':
        'အကောင့်အသစ်ကို စီမံခန့်ခွဲသူ အတည်ပြုပြီးမှ အသုံးပြုနိုင်ပါသည်။',
    'telephone': 'ဖုန်း',
    'password': 'စကားဝှက်',
    'capture': 'Capture',
    'name': 'အမည်',
    'email': 'အီးမေးလ်',
    'address': 'လိပ်စာ',
    'nameOfBusiness': 'လုပ်ငန်းအမည်',
    'currentPosition': 'လက်ရှိရာထူး',
    'typeOfBusiness': 'လုပ်ငန်းအမျိုးအစား',
    'manufacturedProduct': 'ထုတ်ကုန်',
    'confirmedPassword': 'စကားဝှက်အတည်ပြု',
    'oldPassword': 'စကားဝှက်ဟောင်း',
    'newPassword': 'စကားဝှက်အသစ်',
    'submit': 'တင်သွင်းရန်',
    'purchased': 'ဝယ်ယူပြီး',
    'roleLabel': 'အခန်းကဏ္ဍ: {position} · {type}',
    'cartEmpty': 'ခြင်းတောင်း ဗလာဖြစ်နေသည်',
    'cartEmptyBody': 'အခပေးအသိပညာ ထည့်ရန် ကတ်တလော့မှ ရွေးပါ။',
    'knowledgePurchase': 'အသိပညာဝယ်ယူမှု',
    'total': 'စုစုပေါင်း',
    'clearCart': 'ခြင်းတောင်းရှင်းရန်',
    'confirmPurchase': 'ဝယ်ယူမှုအတည်ပြု',
    'payWithMmqr': 'MMQR ဖြင့် ပေးချေရန်',
    'mmqrMessage':
        'ပေးချေပြီးနောက် screenshot ကို Viber ၀၉၀၀၀၀၀ သို့ ပို့ပါ။ ပြေစာကို ၂၄ နာရီအတွင်း အတည်ပြုပြီး SMS ဖြင့် ဆက်သွယ်ပါမည်။ ကျေးဇူးတင်ပါသည်။',
    'done': 'ပြီးပါပြီ',
    'materialInquiry': 'ကုန်ကြမ်းမေးမြန်းမှု',
    'noInquiryYet': 'မေးခွန်း မရှိသေးပါ',
    'noInquiryYetBody':
        'ကုန်ကြမ်း၊ ထုပ်ပိုးမှု သို့မဟုတ် စက်ပစ္စည်း ရွေးပြီး မေးခွန်းရေးပါ။',
    'confirmInquiry': 'မေးခွန်းအတည်ပြု',
    'inquirySent': 'မေးခွန်းပို့ပြီး',
    'inquirySentBody':
        'ကုန်ကြမ်း၊ ထုပ်ပိုးမှုနှင့် စက်ပစ္စည်း/အပိုပစ္စည်းများကို စီမံခန့်ခွဲသူထံ ပို့ပြီးပါပြီ။',
    'notificationsTitle': 'အသိပေးချက်များ',
    'notificationsSubtitle': 'အတည်ပြု၊ စကားဝှက်နှင့် ငွေပေးချေမှု',
    'accountApproved': 'အကောင့်အတည်ပြုပြီး',
    'accountApprovedBody':
        'သင့် Food Doctor အကောင့်ကို အသုံးပြုနိုင်ပါပြီ။ ဤသည်မှာ စီမံခန့်ခွဲသူ ပို့သော SMS ဖြစ်သည်။',
    'passwordResetLink': 'စကားဝှက်ပြန်သတ်မှတ် လင့်ခ်',
    'passwordResetLinkBody':
        'အကောင့်ရှိ ဖုန်းနှင့် အီးမေးလ်သို့ ပြန်သတ်မှတ်လင့်ခ် ပို့ပြီးပါပြီ။',
    'paymentConfirmation': 'ငွေပေးချေမှုအတည်ပြု',
    'paymentConfirmationBody':
        'ပြေစာအတည်ပြုပြီးပါပြီ။ ဝယ်ယူထားသော အသိပညာကို ကျွန်ုပ်၏ အသိပညာတွင် ကြည့်နိုင်ပါသည်။',
    'notFound': 'မတွေ့ရှိပါ',
    'close': 'ပိတ်ရန်',
  };

  String pageLabel(int current, int total) {
    return pageOf
        .replaceAll('{current}', '$current')
        .replaceAll('{total}', '$total');
  }

  String roleFor(String position, String type) {
    return roleLabel
        .replaceAll('{position}', position)
        .replaceAll('{type}', type);
  }
}
