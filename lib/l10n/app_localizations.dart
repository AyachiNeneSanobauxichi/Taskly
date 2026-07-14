import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
  ];

  /// Application name shown as the app title
  ///
  /// In en, this message translates to:
  /// **'Taskly'**
  String get appTitle;

  /// Divider label between primary action and social login
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get commonOr;

  /// Label for the email input field
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get authEmailLabel;

  /// Label for the password input field
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get authPasswordLabel;

  /// Tooltip for the button that reveals the password
  ///
  /// In en, this message translates to:
  /// **'Show password'**
  String get authShowPassword;

  /// Tooltip for the button that hides the password
  ///
  /// In en, this message translates to:
  /// **'Hide password'**
  String get authHidePassword;

  /// Label for the login identifier field that accepts an email or a username
  ///
  /// In en, this message translates to:
  /// **'Email or username'**
  String get authIdentifierLabel;

  /// Validation error when the password does not meet the complexity requirements
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character'**
  String get authPasswordWeak;

  /// Login screen headline
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get loginTitle;

  /// Login screen supporting text under the headline
  ///
  /// In en, this message translates to:
  /// **'Log in to continue managing your tasks'**
  String get loginSubtitle;

  /// Forgot-password link on the login screen
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get loginForgotPassword;

  /// Login submit button label
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get loginSubmit;

  /// Prompt before the sign-up link on the login screen
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get loginNoAccount;

  /// Link that navigates to the register screen
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get loginGoRegister;

  /// Register screen headline
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get registerTitle;

  /// Register screen supporting text under the headline
  ///
  /// In en, this message translates to:
  /// **'Start managing your tasks'**
  String get registerSubtitle;

  /// Label for the username input field
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get registerUsernameLabel;

  /// Label for the confirm-password input field
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get registerConfirmPasswordLabel;

  /// Validation error when the two passwords differ
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get registerPasswordMismatch;

  /// Text before the agreement links in the consent checkbox
  ///
  /// In en, this message translates to:
  /// **'I have read and agree to the '**
  String get registerAgreementPrefix;

  /// User agreement link text
  ///
  /// In en, this message translates to:
  /// **'User Agreement'**
  String get registerUserAgreement;

  /// Conjunction between the two agreement links
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get registerAgreementAnd;

  /// Privacy policy link text
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get registerPrivacyPolicy;

  /// Validation error when the consent checkbox is not checked
  ///
  /// In en, this message translates to:
  /// **'Please read and agree to the User Agreement first'**
  String get registerAgreementRequired;

  /// Register submit button label
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get registerSubmit;

  /// Prompt before the log-in link on the register screen
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get registerHaveAccount;

  /// Link that navigates to the login screen
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get registerGoLogin;

  /// Generic fallback error message shown when an auth request fails
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get authErrorGeneric;

  /// Snackbar shown after a successful registration, prompting the user to log in
  ///
  /// In en, this message translates to:
  /// **'Account created. Please log in.'**
  String get registerSuccess;

  /// Placeholder text shown on the home screen in v1 routing
  ///
  /// In en, this message translates to:
  /// **'Home (placeholder)'**
  String get homeTitle;

  /// Test button on the home screen that returns to the login screen
  ///
  /// In en, this message translates to:
  /// **'Back to login'**
  String get homeBackToLogin;

  /// Generic cancel button label
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// Generic save button label
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get commonSave;

  /// Generic retry button label
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get commonRetry;

  /// Todo list screen title
  ///
  /// In en, this message translates to:
  /// **'My Tasks'**
  String get todoListTitle;

  /// Placeholder for the todo name search field
  ///
  /// In en, this message translates to:
  /// **'Search tasks'**
  String get todoSearchHint;

  /// Logout action tooltip on the todo list app bar
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get todoLogout;

  /// Empty state on the todo list
  ///
  /// In en, this message translates to:
  /// **'No tasks yet'**
  String get todoEmpty;

  /// Error state on the todo list
  ///
  /// In en, this message translates to:
  /// **'Failed to load. Pull to refresh.'**
  String get todoLoadError;

  /// Edit action in the todo item menu
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get todoActionEdit;

  /// Delete action in the todo item menu
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get todoActionDelete;

  /// Type filter option meaning no type filter
  ///
  /// In en, this message translates to:
  /// **'All types'**
  String get todoFilterTypeAll;

  /// Status filter option meaning no status filter
  ///
  /// In en, this message translates to:
  /// **'All statuses'**
  String get todoFilterStatusAll;

  /// Todo type: normal
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get todoTypeNormal;

  /// Todo type: important
  ///
  /// In en, this message translates to:
  /// **'Important'**
  String get todoTypeImportant;

  /// Todo type: urgent
  ///
  /// In en, this message translates to:
  /// **'Urgent'**
  String get todoTypeUrgent;

  /// Todo status: pending
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get todoStatusPending;

  /// Todo status: doing
  ///
  /// In en, this message translates to:
  /// **'Doing'**
  String get todoStatusDoing;

  /// Todo status: completed
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get todoStatusCompleted;

  /// Delete confirmation dialog title
  ///
  /// In en, this message translates to:
  /// **'Delete task?'**
  String get todoDeleteTitle;

  /// Delete confirmation dialog message
  ///
  /// In en, this message translates to:
  /// **'\"{name}\" will be deleted.'**
  String todoDeleteMessage(String name);

  /// Snackbar after a successful delete
  ///
  /// In en, this message translates to:
  /// **'Task deleted'**
  String get todoDeleteSuccess;

  /// Title of the edit bottom sheet
  ///
  /// In en, this message translates to:
  /// **'Edit task'**
  String get todoEditTitle;

  /// Label for the todo name field
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get todoFieldName;

  /// Label for the todo content field
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get todoFieldContent;

  /// Label for the todo type field
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get todoFieldType;

  /// Label for the todo status field
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get todoFieldStatus;

  /// Snackbar after a successful save
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get todoSaveSuccess;

  /// Todo detail screen title
  ///
  /// In en, this message translates to:
  /// **'Task detail'**
  String get todoDetailTitle;

  /// Label for the created-at timestamp on the detail screen
  ///
  /// In en, this message translates to:
  /// **'Created at'**
  String get todoDetailCreatedAt;

  /// Label for the updated-at timestamp on the detail screen
  ///
  /// In en, this message translates to:
  /// **'Updated at'**
  String get todoDetailUpdatedAt;

  /// Label for the create-task action (FAB) and the create sheet title
  ///
  /// In en, this message translates to:
  /// **'New task'**
  String get todoNewTask;

  /// Snackbar after a successful create
  ///
  /// In en, this message translates to:
  /// **'Task created'**
  String get todoCreateSuccess;

  /// Button that clears all active search filters
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get todoClearFilters;

  /// Filter sheet title and filter button tooltip
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get todoFilters;

  /// Generic apply button label
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get commonApply;

  /// Generic reset button label
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get commonReset;

  /// Message shown by the router error page for an unknown route
  ///
  /// In en, this message translates to:
  /// **'Page not found'**
  String get routeNotFound;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
