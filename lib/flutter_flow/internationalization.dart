import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    'fkid4w7w': {
      'es': 'Inicia sesion',
      'en': '',
    },
    'vq75yvrx': {
      'es': 'Necesitas una cuenta para ingresar',
      'en': '',
    },
    'xckgsfsa': {
      'es': 'Email',
      'en': '',
    },
    'ujfbnji6': {
      'es': 'Password',
      'en': '',
    },
    'y4zid23q': {
      'es': 'Entrar',
      'en': '',
    },
    '3v4x8vkw': {
      'es': '¿No tienes cuenta? Da click aqui.',
      'en': '',
    },
    'hm6xoz6k': {
      'es': 'Home',
      'en': '',
    },
  },
  // CreateAccount
  {
    'yn44jpdo': {
      'es': 'Reseñas de Videojuegos',
      'en': '',
    },
    '34m3jyjc': {
      'es': 'Empecemos',
      'en': '',
    },
    '0jkyy3h1': {
      'es': 'Reseñas de videjuegos pero primero hay que crear una cuenta . . .',
      'en': '',
    },
    'pgde7j4t': {
      'es': 'Email',
      'en': '',
    },
    'lpr8nv5i': {
      'es': 'Contraseña',
      'en': '',
    },
    'awp88vs4': {
      'es': 'Ingrese una contraseña con mas de 6 caracteres',
      'en': '',
    },
    'jovm7sid': {
      'es': 'Confirmar contraseña',
      'en': '',
    },
    '42g0blyu': {
      'es': 'Crear cuenta',
      'en': '',
    },
    '5zautolp': {
      'es': 'Ya tienes una cuenta? ',
      'en': '',
    },
    'qp5xy7a1': {
      'es': 'Da click aqui.',
      'en': '',
    },
    'qxx7oqse': {
      'es': 'Home',
      'en': '',
    },
  },
  // homepage
  {
    'mwj0yyaf': {
      'es': 'Reseñas de Juegos',
      'en': '',
    },
    'etmx8r15': {
      'es': 'Tu destino para reseñas honestas de videojuegos',
      'en': '',
    },
    'uut2ego9': {
      'es': '¡Bienvenido Gamer!',
      'en': '',
    },
    'oj63ebsz': {
      'es':
          'Descubre las últimas reseñas de tus juegos favoritos y comparte tus propias experiencias con la comunidad.',
      'en': '',
    },
    'b6txrbpy': {
      'es': 'Ver Reseñas',
      'en': '',
    },
  },
  // plantilla
  {
    'r7vx31ux': {
      'es': 'Comparte tu experiencia con la comunidad',
      'en': '',
    },
    'p913k2qx': {
      'es': 'Reseña',
      'en': '',
    },
    'ctv7pwy2': {
      'es': 'Puntuación',
      'en': '',
    },
    '9ysiz3ga': {
      'es': 'Imagen Promocional',
      'en': '',
    },
    'xko77isv': {
      'es': 'Trailer de Lanzamiento',
      'en': '',
    },
    'got7qp9e': {
      'es': 'El usuario que compartio esta reseña fue:',
      'en': '',
    },
    'hiztji3c': {
      'es': 'Home',
      'en': '',
    },
  },
  // resenas
  {
    'gjo92odo': {
      'es': 'Reseñas de Juegos',
      'en': '',
    },
    '8qmko426': {
      'es': 'Descubre las últimas opiniones de la comunidad',
      'en': '',
    },
    'jo2b9icc': {
      'es': 'Ultimas reseñas',
      'en': '',
    },
    't47ih4t9': {
      'es': 'Añadir nueva reseña  +',
      'en': '',
    },
    '480del6n': {
      'es': 'Cerrar Sesión',
      'en': '',
    },
  },
  // createresena
  {
    '1ty05ih9': {
      'es': 'Añadir Reseña',
      'en': '',
    },
    'ea9ri5dn': {
      'es': 'Título del Juego',
      'en': '',
    },
    'wactfrgc': {
      'es': 'Ingresa el título del videojuego',
      'en': '',
    },
    'nj3saibs': {
      'es': 'Tu Reseña',
      'en': '',
    },
    'ua7nerd3': {
      'es': 'Escribe tu opinión sobre el juego...',
      'en': '',
    },
    'bqc2lxeu': {
      'es': 'Calificación',
      'en': '',
    },
    '323jibqd': {
      'es': 'Toca para calificar (1-5 estrellas)',
      'en': '',
    },
    'rfk0wfxm': {
      'es': 'Imagen del Juego',
      'en': '',
    },
    '2qrip3wf': {
      'es': 'Añadir imagen del juego',
      'en': '',
    },
    'z232425a': {
      'es': 'URL de la imagen o sube una foto',
      'en': '',
    },
    'rgxyt6pp': {
      'es': 'URL del Tráiler',
      'en': '',
    },
    'w0djhy66': {
      'es': 'URL del tráiler de YouTube',
      'en': '',
    },
    'z7b2psdr': {
      'es': 'Publicar Reseña',
      'en': '',
    },
  },
  // Miscellaneous
  {
    's5blrs16': {
      'es': '',
      'en': '',
    },
    'stjjt1to': {
      'es': '',
      'en': '',
    },
    'dsyz3d3o': {
      'es': '',
      'en': '',
    },
    '24csl64a': {
      'es': '',
      'en': '',
    },
    'ws5gk5j8': {
      'es': '',
      'en': '',
    },
    '2cm088nu': {
      'es': '',
      'en': '',
    },
    'zhn5yb4c': {
      'es': '',
      'en': '',
    },
    'ntmk07bp': {
      'es': '',
      'en': '',
    },
    'z3jim090': {
      'es': '',
      'en': '',
    },
    'n2ud9kdi': {
      'es': '',
      'en': '',
    },
    'bnb30wcr': {
      'es': '',
      'en': '',
    },
    '2b8lze4x': {
      'es': '',
      'en': '',
    },
    'pg68t8kd': {
      'es': '',
      'en': '',
    },
    'sae6j80b': {
      'es': '',
      'en': '',
    },
    'hppakqw4': {
      'es': '',
      'en': '',
    },
    'atoli11a': {
      'es': '',
      'en': '',
    },
    'c09plwaj': {
      'es': '',
      'en': '',
    },
    '3y6k6ke4': {
      'es': '',
      'en': '',
    },
    '8l3jusyj': {
      'es': '',
      'en': '',
    },
    't23v4vqw': {
      'es': '',
      'en': '',
    },
    'nglbi4nf': {
      'es': '',
      'en': '',
    },
    'vd8a16pp': {
      'es': '',
      'en': '',
    },
    '2v332dyk': {
      'es': '',
      'en': '',
    },
    'o251nb63': {
      'es': '',
      'en': '',
    },
    'd4k0mtxs': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
