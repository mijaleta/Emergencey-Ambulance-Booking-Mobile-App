class OromoLegalContent {
  final String title;
  final String content;

  OromoLegalContent({required this.title, required this.content});

  // Terms of Service content
  static OromoLegalContent termsOfServiceContent() {
    return OromoLegalContent(
      title: 'Haala Tajaajilaa',
      content: '''
      Appilikeeshinii mobaayilaa Ambulaansii Hatattamaa Booking ("Appii") fayyadamuudhaan, haalawwanii fi dambiiwwan kana (“Haalawwan") akka eegdu fi akka itti hidhamtu walii galtee qabda. Maaloo App fayyadamuu dura Haalawwan kana sirriitti dubbisaa.
      
      1. Tajaajila Balaa Tasaa: Appichi fayyadamtoonni tajaajila ambulaansii hatattamaa akka gaafatan waltajjii ni kenna.
      
      2. Itti Gaafatamummaa Fayyadamtootaa: Fayyadamtoonni yeroo tajaajila ambulaansii gaafatan odeeffannoo sirrii ta’e kennuu qabu. Tajaajila Appii kanaa karaa sirrii hin taaneen itti fayyadamuun ykn itti fayyadamuun akkaawuntii addaan cituu fiduu danda'a.
      
      3. Gaaffii Sobaa: Gaaffii sobaa tajaajila ambulaansii dhiyeessuun cimsee kan dhorkamee fi tarkaanfii seeraa fudhachuu danda’a. Fayyadamtoonni gaaffii sobaa dhiyeessaa jiran aanga'ootaaf kan gabaafaman yoo ta'u, adabbii maallaqaa fi himannaa yakkaa dabalatee tarkaanfiin seeraa isaan irratti fudhatamuu danda'a.
      
      4. Daangaa Itti Gaafatamummaa: Appichi fi miseensonni isaa miidhaa kallattiin, al-kallattiin, tasa, addaa, ykn bu’aa irraa kan ka’e itti fayyadama Appicha irraa kan ka’e ykn karaa kamiinuu walqabatee dhufu kamiifuu itti gaafatamummaa hin qabaatan.
      
      5. Iccitii: Iccitii keessan eeguuf waadaa seennee jirra. Imaammanni Dhuunfaa keenya akkaataa odeeffannoo walitti qabnu, itti fayyadamnu fi ibsinu ibsa. Appicha fayyadamuudhaan Imaammata Dhuunfaa irratti walii galtee qabda.
      
      6. Fooyya’iinsa: Yeroo barbaannetti Haalawwan kana fooyyessuu ykn fooyyessuuf mirga qabna. Jijjiirama akkasii kamiyyuu booda Appicha itti fayyadamuun itti fufuun Haalawwan haaraa fudhachuu kee agarsiisa.
      
      Maaloo Haala Tajaajilaa guutuu marsariitii keenya irratti argamu ilaalaa.
      ''',
    );
  }

  // Privacy Policy content
  static OromoLegalContent privacyPolicyContent() {
    return OromoLegalContent(
      title: 'Imaammata',
      content: '''
      Imaammanni Dhuunfaa keenya yeroo aplikeeshinii mobaayilaa Ambulaansii Hatattamaa Booking ("Appii") fayyadamtan akkaataa odeeffannoo itti walitti qabnu, itti fayyadamnu, fi ibsinu ibsa. Appicha fayyadamuudhaan, akkaataa imaammata kanaatiin odeeffannoo walitti qabuu fi itti fayyadamuu irratti walii galtee qabda.

      Odeeffannoo Walitti Qabuu fi Itti Fayyadamaa: Yeroo tajaajila ambulaansii gaafachuuf Appii fayyadamtan odeeffannoo dhuunfaa kan akka maqaa keessanii, odeeffannoo quunnamtii keessanii fi bakka keessan walitti qabuu dandeenya.

      Odeeffannoo Qooduun: Ergaa ambulaansii haala mijeessuuf odeeffannoo keessan dhaabbilee tajaajila hatattamaa kennan waliin qooduun ni danda’ama.

      Nageenya Daataa: Odeeffannoo dhuunfaa keessan eeguuf tarkaanfiiwwan nageenyaa hojiirra oolchina, garuu mala interneetii ykn kuusaa elektirooniksiitiin dabarsuu kamiyyuu 100% nageenya hin qabu.

      Iccitii Daa'immanii: Appiin kun namoota dhuunfaa umuriin isaanii waggaa 13 gadi ta'eef akka itti fayyadamaniif kan yaadame miti.Nuti osoo beeknuu odeeffannoo dhuunfaa daa'imman irraa hin sassaabnu.

      Jijjiirama Imaammata Dhuunfaa Kana Irratti Taasifamu: Imaammata Dhuunfaa keenya yeroo yeroon haaromsuu dandeenya. Jijjiirama kamiyyuu yoo ilaalle fuula kana yeroo yeroon akka ilaaltan isin gorfama.

      Nu Qunnamaa: Waa’ee Imaammata Dhuunfaa keenyaa gaaffii yoo qabaattan, maaloo nu qunnamaa.
      ''',
    );
  }
}
