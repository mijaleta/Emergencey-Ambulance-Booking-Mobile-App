class LegalContent {
  final String title;
  final String content;

  LegalContent({required this.title, required this.content});

  // Terms of Service content
  static LegalContent termsOfServiceContent() {
    return LegalContent(
      title: 'Terms of Service',
      content: '''
      By using the Emergency Ambulance Booking mobile application (the "App"), you agree to comply with and be bound by these terms and conditions (the "Terms"). Please read these Terms carefully before using the App.
      
      1. Emergency Services: The App provides a platform for users to request emergency ambulance services.
      
      2. User Responsibilities: Users must provide accurate information when requesting ambulance services. Misuse or abuse of the App's services may result in account suspension.
      
      3. Fake Requests: Submitting a fake request for ambulance services is strictly prohibited and may result in legal action. Users found to be submitting fake requests will be reported to the authorities, and legal actions, including fines and criminal charges, may be taken against them.
      
      4. Limitation of Liability: The App and its affiliates shall not be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in any way connected with the use of the App.
      
      5. Privacy: We are committed to protecting your privacy. Our Privacy Policy explains how we collect, use, and disclose information. By using the App, you agree to the Privacy Policy.
      
      6. Modifications: We reserve the right to modify or amend these Terms at any time. Continued use of the App after any such changes constitutes your acceptance of the new Terms.
      
      Please review the complete Terms of Service available on our website.
      ''',
    );
  }

  // Privacy Policy content
  static LegalContent privacyPolicyContent() {
    return LegalContent(
      title: 'Privacy Policy',
      content: '''
      Our Privacy Policy explains how we collect, use, and disclose information when you use the Emergency Ambulance Booking mobile application (the "App"). By using the App, you agree to the collection and use of information in accordance with this policy.

      Information Collection and Use: We may collect personal information such as your name, contact information, and location when you use the App to request ambulance services.

      Information Sharing: We may share your information with emergency service providers to facilitate ambulance dispatch.

      Data Security: We implement security measures to protect your personal information, but no method of transmission over the internet or electronic storage is 100% secure.

      Children's Privacy: The App is not intended for use by individuals under the age of 13. We do not knowingly collect personal information from children.

      Changes to This Privacy Policy: We may update our Privacy Policy from time to time. You are advised to review this page periodically for any changes.

      Contact Us: If you have any questions about our Privacy Policy, please contact us.
      ''',
    );
  }
}
