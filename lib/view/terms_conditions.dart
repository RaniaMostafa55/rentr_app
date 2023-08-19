import '../controller/imports.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(title: "Terms and Condidtions"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LocaleText(
                "terms_first_text",
                style: TextStyle(
                    fontSize: 18,
                    color: mainColor,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              CacheHelper.getBool(key: "isEnglish", choice: true)
                  ? const Text(
                      " • Application is not responsible for any damage between the lessor and the lessor, for example, but not exclusively: damage and theft. The application is also not responsible for any loss, risk or trace arising between the lessor and the lessor or any other party or resulting from the mediation process of the application. In the event of damage, an official communication must be submitted to the competent authorities.\n • Application is not responsible for any meetings or talks between the parties used for application outside or within application.\n • Failure to harm employees in any form.\n • If your assessment is low or if there is an increase in negative complaints against you, the application is entitled to act as it deems appropriate.\n • Acknowledge that you have followed all relevant laws, regulations, and regulations during the use of the application.\n • Your recognition of the right to control private communications when necessary for non-compliance with the Employment Convention.\n • To grant the right to apply by preserving your data and information and to have access to it.\n • Acknowledge your agreement to show your data (name - mobile number) to other users.\n • Acknowledge your approval of the right to share information in the event of theft of damage.\n • If you violate the regulations of the Kingdom of Saudi Arabia or the implementing laws, we shall have the right of recourse to you for all damages and losses and the payment of legal fees in all cases and matters relating to your violation and shall be obliged to compensate for them.\n • Not to present any inappropriate purpose for the classifications available in the application that are not allowed to be traded in Saudi Arabia.\n • Not to break through or circumvent its policies.\n • No illegal means of access to user data or violation of application rights.\n • There is no violation of intellectual property rights for application.\n • The collection or use of personal data of users and their communications for unauthorized purposes or their disclosure to anyone except with the consent of the person to whom the personal data relate or if the regulations so require.\n • Not to do anything that would damage the reputation of the application, whether in the application itself or in social media sites. The application reserves the right to return to you with all the resulting damage.\n • Not to impersonate a character, a representative, an employee, or any quality that suggests that you are a subordinate to the application.\n • No rent or rent for:\n 1.	Goods prohibited under the laws of Saudi Arabia.\n 2.	Weapons of all kinds, even if licensed.\n 3. Sexual products in all their forms.\n 4. Medicines and health products, even if licensed.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.75,
                        fontSize: 16,
                      ),
                    )
                  : const Text(
                      " •	التطبيق غير مسؤول عن أي أضرار بين المُؤجر والمُستأجر على سبيل المثال وليس الحصر: الإتلاف والسرقة. كذلك أن التطبيق غير مسؤول عن أي خسائر او مُخاطرة او تبِعات تنشأ بين المُؤجر والمُستأجر او أي طرف اخر أو التي تنتج عن عملية الوساطة التي يقوم بها هذا التطبيق. وفي حال حصول الضرر يجب تقديم بلاغ رسمي للجهات المختصة.\n •	التطبيق غير مسؤول عن أي لقاءات أو محادثات تحصل بين الأطراف المستخدمة للتطبيق خارج أو داخل التطبيق.\n •	عدم الحاق الضرر بالمستخدمين باي شكل كان.\n •	في حال انخفاض تقييمك أو في حال ازدياد الشكاوى السلبية بحقك فإنه يحق للتطبيق التصرف بما يراه مناسباً.\n •	إقرارك باتباعك لجميع القوانين واللوائح والأنظمة ذات الصلة أثناء استخدام التطبيق.\n •	إقرارك بأحقية التطبيق في مراقبة الرسائل الخاصة عند الضرورة لخلوها من مخالفات اتفاقية الاستخدام.\n •	إقرارك بمنح الحق للتطبيق بحفظ بياناتك ومعلوماتك ولنا حق الاطلاع عليها.\n •	تقر موافقتك على إظهار بياناتك (الاسم- رقم الجوال) للمستخدمين الآخرين.\n •	تقر موافقتك بأحقية التطبيق في مشاركة المعلومات في حالة السرقة الاتلاف.\n •	في حال مخالفتك للأنظمة في المملكة العربية السعودية او قوانين التطبيق، لنا حق الرجوع إليك بكافة الأضرار والخسائر وتحميلك أتعاب المحاماة في جميع القضايا والمسائل المتعلقة بمخالفتك وتلتزم بالتعويض عنها.\n •	عدم عرض أي غرض غير ملائم للتصنيفات المتاحة في التطبيق وغير مسموح بتداوله في المملكة العربية السعودية.\n •	عدم اختراق التطبيق او التحايل على سياساته.\n •	عدم استخدام أي وسيلة غير شرعية للوصول لبيانات المستخدمين او انتهاك حقوق التطبيق.\n •	عدم انتهاك حقوق الملكية الفكرية للتطبيق.\n •	عدم جمع او استعمال البيانات الشخصية للمستخدمين واتصالاته لأغراض غير مصرح بها او الإفصاح عنها لاي جهة الا بموافقة من تتعلق به البيانات الشخصية او إذا اقتضت الأنظمة ذلك.\n •	عدم الإقدام على أي ما من شأنه الحاق الضرر بسمعة التطبيق سواء في التطبيق نفسه او في مواقع التواصل الاجتماعي ويحتفظ التطبيق بحقه في الرجوع عليك بكافة الأضرار المترتبة على ذلك.\n •	عدم انتحال صفة، أو ممثل، أو موظف، أو أي صفة توحي بانك تابع للتطبيق.\n •	عدم ايجار او استئجار كل من:\n   1.	السلع الممنوعة حسب قوانين المملكة العربية السعودية.\n   2.	الأسلحة بجميع أنواعها، حتى لو مرخصة.\n   3.	المنتجات الجنسية بجميع أشكالها.\n   4.	الأدوية والمنتجات الصحية ولو كانت مرخصة.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.75,
                        fontSize: 16,
                      ),
                    ),
              const SizedBox(height: 15),
              const LocaleText(
                "terms_third_text",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w500, color: secColor),
              )
              // SizedBox(height: 8),
              // Text(
              //   " •	التطبيق غير مسؤول عن أي لقاءات أو محادثات تحصل بين الأطراف المستخدمة للتطبيق خارج أو داخل التطبيق.",
              //   style: TextStyle(fontSize: 16),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   " •	عدم الحاق الضرر بالمستخدمين باي شكل كان.",
              //   style: TextStyle(fontSize: 16),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   " •	في حال انخفاض تقييمك أو في حال ازدياد الشكاوى السلبية بحقك فإنه يحق للتطبيق التصرف بما يراه مناسباً.",
              //   style: TextStyle(fontSize: 16),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   " •	إقرارك باتباعك لجميع القوانين واللوائح والأنظمة ذات الصلة أثناء استخدام التطبيق.",
              //   style: TextStyle(fontSize: 16),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   " •	إقرارك بأحقية التطبيق في مراقبة الرسائل الخاصة عند الضرورة لخلوها من مخالفات اتفاقية الاستخدام.",
              //   style: TextStyle(fontSize: 16),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   " •	إقرارك بمنح الحق للتطبيق بحفظ بياناتك ومعلوماتك ولنا حق الاطلاع عليها.",
              //   style: TextStyle(fontSize: 16),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   " •	تقر موافقتك على إظهار بياناتك (الاسم- رقم الجوال) للمستخدمين الآخرين. ",
              //   style: TextStyle(fontSize: 16),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   " •	تقر موافقتك بأحقية التطبيق في مشاركة المعلومات في حالة السرقة الاتلاف.",
              //   style: TextStyle(fontSize: 16),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   " •	في حال مخالفتك للأنظمة في المملكة العربية السعودية او قوانين التطبيق، لنا حق الرجوع إليك بكافة الأضرار والخسائر وتحميلك أتعاب المحاماة في جميع القضايا والمسائل المتعلقة بمخالفتك وتلتزم بالتعويض عنها.",
              //   style: TextStyle(fontSize: 16),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   " •	عدم عرض أي غرض غير ملائم للتصنيفات المتاحة في التطبيق وغير مسموح بتداوله في المملكة العربية السعودية.",
              //   style: TextStyle(fontSize: 16),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   " •	عدم اختراق التطبيق او التحايل على سياساته.",
              //   style: TextStyle(fontSize: 16),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   " •	عدم استخدام أي وسيلة غير شرعية للوصول لبيانات المستخدمين او انتهاك حقوق التطبيق.",
              //   style: TextStyle(fontSize: 16),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   " •	عدم انتهاك حقوق الملكية الفكرية للتطبيق.",
              //   style: TextStyle(fontSize: 16),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   " •	عدم جمع او استعمال البيانات الشخصية للمستخدمين واتصالاته لأغراض غير مصرح بها او الإفصاح عنها لاي جهة الا بموافقة من تتعلق به البيانات الشخصية او إذا اقتضت الأنظمة ذلك.",
              //   style: TextStyle(fontSize: 16),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   " •	عدم الإقدام على أي ما من شأنه الحاق الضرر بسمعة التطبيق سواء في التطبيق نفسه او في مواقع التواصل الاجتماعي ويحتفظ التطبيق بحقه في الرجوع عليك بكافة الأضرار المترتبة على ذلك.",
              //   style: TextStyle(fontSize: 16),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   " •	عدم انتحال صفة، أو ممثل، أو موظف، أو أي صفة توحي بانك تابع للتطبيق.",
              //   style: TextStyle(fontSize: 16),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   " •	عدم ايجار او استئجار كل من:",
              //   style: TextStyle(fontSize: 16),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   "   1.	السلع الممنوعة حسب قوانين المملكة العربية السعودية.",
              //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
