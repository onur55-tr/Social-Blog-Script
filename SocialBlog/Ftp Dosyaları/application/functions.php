<?php 
/*
 * -------------------------------------
 * Miguel Vasquez
 * functions.php
 * -------------------------------------
 */
class _Function
{
	// spaces
	public static function spaces($string) {
	  return ( preg_replace('/(\s+)/u',' ',$string ) );
	
	}
	
	public static function checkEmail( $str ) {
		return preg_match("/^[\.A-z0-9_\-\+]+[@][A-z0-9_\-]+([.][A-z0-9_\-\.]+)+[A-z]{2,4}$/", $str);
	}

 	public static function send_mail( $from, $to, $subject, $body ) {
		$headers = '';
		$headers .= "MIME-Version: 1.0\n";
		$headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";
		$headers .= "From: $from\n";
		$headers .= "Reply-To: $from\n" . 
		'X-Mailer: PHP/' . phpversion();
	
		mail( $to, $subject , $body, $headers );
	}
	
	/* Emoticons */
	public static function emoticons( $text )
    {
		$change = array(
			':D'=> '<i class="emoticons emoticons_smile" title=":D"></i>',
			':d'=> '<i class="emoticons emoticons_smile" title=":D"></i>',
			':)'=> '<i class="emoticons emoticons_smile_2" title=":)"></i>',
			':P'=> '<i class="emoticons emoticons_tongue" title=":P"></i>',
			':p'=> '<i class="emoticons emoticons_tongue" title=":P"></i>',
			':('=> '<i class="emoticons emoticons_sad" title=":("></i>',
			';)'=> '<i class="emoticons emoticons_wink" title=";)"></i>',
			':O'=> '<i class="emoticons emoticons_suprised" title=":O"></i>',
			':o'=> '<i class="emoticons emoticons_suprised" title=":O"></i>',
			'&lt;3'=> '<i class="emoticons emoticons_like" title="<3"></i>',
		);
		
		$output = strtr( $text , $change );
		return $output;
	}
	//============== linkText
	 public static function linkText( $text ) { 
		
	    $ret = ' ' . $text; 
	    $ret = preg_replace("#([\t\r\n ])([a-z0-9]+?){1}://([\w\-]+\.([\w\-]+\.)*[\w]+(:[0-9]+)?(/[^ \"\n\r\t<]*)?)#i", '\1<a href="\2://\3" target="_blank">\3</a>', $ret); 
	    $ret = preg_replace("#([\t\r\n ])(www|ftp)\.(([\w\-]+\.)*[\w]+(:[0-9]+)?(/[^ \"\n\r\t<]*)?)#i", '\1<a href="http://\2.\3" target="_blank">\2.\3</a>', $ret); 
	    $ret = preg_replace("#([\n ])([a-z0-9\-_.]+?)@([\w\-]+\.([\w\-\.]+\.)*[\w]+)#i", "\\1<a href=\"mailto:\\2@\\3\">\\2@\\3</a>", $ret); 
	    $ret = substr( $ret, 1 ); 
	    return( $ret ); 
	}
	 
	public static function bitLyUrl( $url ) {
		$path   = "http://api.bit.ly/v3/";
		$user   = BIT_URL_USER;
		$key    = BIT_URL_KEY;
        $temp   = $path."shorten?login=".$user."&apiKey=".$key."&uri=".$url."&format=json";
		$data   = file_get_contents( $temp );
		$output = json_decode( $data );
		return $output->data->url;
	}
	
	public static function checkText( $str ) {
		
		$str = trim( self::spaces( $str ) );
		if( mb_strlen( $str, 'utf8' ) < 1 ) {
			return false;
		}
		
		$str = nl2br( htmlspecialchars( $str ) );
		$str = str_replace( array( chr( 10 ), chr( 13 ) ), '' , $str );
		
		// Hashtags and @Mentions
    	$str = preg_replace_callback('~([#@])([^\s#@]+)~',
    	create_function('$m', '$dir = $m[1] == "#" ? "search/?q=%23" : "./";' .
    	'return "<a href=\"$dir$m[2]\">$m[0]</a>";' ),
        $str );
		/* Link text */
		$str = self :: linkText( $str );
		/* Emoticons */
		$str = self :: emoticons( $str );
		$str = stripslashes( $str );
		//$str = str_replace( '&lt;br /&gt;', '<br />', $str );
		
		//return wordwrap( $str, 60, "\r\n", TRUE );
		return $str;
	}
	
	public static function checkTextDb( $str ) {
		
		$str = trim( self::spaces( $str ) );
		if( mb_strlen( $str, 'utf8' ) < 1 ) {
			return false;
		}
		
		$str = nl2br( $str );
		
		$str = str_replace(array(chr(10),chr(13)),'',$str);
				
		return $str;
	}
	
	public static function checkTextMessages( $str ) {
		
		$str = trim( self::spaces( $str ) );
		if( mb_strlen( $str, 'utf8' ) < 1 ) {
			return false;
		}
		$str = nl2br( htmlspecialchars ( $str ) );
		$str = str_replace( array( chr( 10 ), chr( 13 ) ), '' , $str );
		$str = stripslashes( $str );
		/* Emoticons */
		$str = self :: emoticons( $str );
		
		return wordwrap( $str, 60, "\n", TRUE );
	}
	
	public static function resizeImage( $image, $width, $height, $scale, $imageNew = null ) {
		
		list($imagewidth, $imageheight, $imageType) = getimagesize($image);
	$imageType = image_type_to_mime_type($imageType);
	$newImageWidth = ceil($width * $scale);
	$newImageHeight = ceil($height * $scale);
	$newImage = imagecreatetruecolor($newImageWidth,$newImageHeight);
	switch($imageType) {
		case "image/gif":
			$source=imagecreatefromgif($image); 
			imagefill( $newImage, 0, 0, imagecolorallocate( $newImage, 255, 255, 255 ) );
			imagealphablending( $newImage, TRUE );
			break;
	    case "image/pjpeg":
		case "image/jpeg":
		case "image/jpg":
			$source=imagecreatefromjpeg($image); 
			break;
	    case "image/png":
		case "image/x-png":
			$source=imagecreatefrompng($image); 
			imagefill( $newImage, 0, 0, imagecolorallocate( $newImage, 255, 255, 255 ) );
			imagealphablending( $newImage, TRUE );
			break;
  	}
	imagecopyresampled($newImage,$source,0,0,0,0,$newImageWidth,$newImageHeight,$width,$height);
	
	switch($imageType) {
		case "image/gif":
	  		imagegif( $newImage, $imageNew ); 
			break;
      	case "image/pjpeg":
		case "image/jpeg":
		case "image/jpg":
	  		imagejpeg( $newImage, $imageNew ,90 ); 
			break;
		case "image/png":
		case "image/x-png":
			imagepng( $newImage, $imageNew );  
			break;
    }
	
	chmod($image, 0777);
	return $image;
	}

public static function resizeImageFixed( $image, $width, $height, $imageNew = null ) {
		
	list($imagewidth, $imageheight, $imageType) = getimagesize($image);
	$imageType = image_type_to_mime_type($imageType);
	$newImage = imagecreatetruecolor($width,$height);
	
	switch($imageType) {
		case "image/gif":
			$source=imagecreatefromgif($image); 
			imagefill( $newImage, 0, 0, imagecolorallocate( $newImage, 255, 255, 255 ) );
			imagealphablending( $newImage, TRUE );
			break;
	    case "image/pjpeg":
		case "image/jpeg":
		case "image/jpg":
			$source=imagecreatefromjpeg($image); 
			break;
	    case "image/png":
		case "image/x-png":
			$source=imagecreatefrompng($image); 
			imagefill( $newImage, 0, 0, imagecolorallocate( $newImage, 255, 255, 255 ) );
			imagealphablending( $newImage, TRUE );
			break;
  	}
	if( $width/$imagewidth > $height/$imageheight ){
        $nw = $width;
        $nh = ($imageheight * $nw) / $imagewidth;
        $px = 0;
        $py = ($height - $nh) / 2;
    } else {
        $nh = $height;
        $nw = ($imagewidth * $nh) / $imageheight;
        $py = 0;
        $px = ($width - $nw) / 2;
    }
	
	imagecopyresampled($newImage,$source,$px, $py, 0, 0, $nw, $nh, $imagewidth, $imageheight);
	
	switch($imageType) {
		case "image/gif":
	  		imagegif($newImage,$imageNew); 
			break;
      	case "image/pjpeg":
		case "image/jpeg":
		case "image/jpg":
	  		imagejpeg($newImage,$imageNew,90); 
			break;
		case "image/png":
		case "image/x-png":
			imagepng($newImage,$imageNew);  
			break;
    }
	
		chmod($image, 0777);
		return $image;
	}
	
	public static function getHeight( $image ) {
		$size   = getimagesize( $image );
		$height = $size[1];
		return $height;
	}
	
	public static function getWidth( $image ) {
		$size  = getimagesize( $image);
		$width = $size[0];
		return $width;
	}
	
	//<--- stringRandom
	public static function stringRandom( $long = 16, $chars = '0123456789abcdefghijklmnopqrstuvwxyz!~^#!{}@+*' ) {
    $string = '';
    $max = mb_strlen( $chars ) - 1 ;

    for( $i = 0; $i < $long; ++$i ){
    	
        $string .= mb_substr( $chars, mt_rand( 0, $max ), 1 );
    }
    return $string;
	
	}
	
	//=============== ID HASH
	public static function idHash( $id ) {
		return sha1('~#bae!´+*%=?¿B63~23!~^'.( $id ).microtime().self::stringRandom() );
	}
	
	//=================== cropString
	public static function cropString( $content, $chars ) {
		
	 	return	mb_substr( $content,0, $chars, 'UTF-8' )."..."; 	
	}
	
	
	
	//=================== cropString
	public static function cropStringLimit( $content, $chars ) {
		return	mb_substr( $content,0, $chars, 'UTF-8' ); 
	}
	
	function focusText( $find, $text, $repl = '<strong style="color: #FF7000;">%s</strong>', $ord = 32 ) {
	$find = self::spaces( trim ( $find ) );
    $char = is_numeric( $ord ) ? chr( $ord ) : $ord[0]; // caracter?
    $fn = create_function('$test', 'static $_num = 0, $_tags;
            if (is_numeric($test[1])) return $_tags[$test[1]];
                        $_tags[$_num] = $test[1];
                $tag = "__!{$_num}__";
    ++$_num; return $tag;');

    $text = preg_replace_callback('/((?:<|&lt;|\[).+(?:>|&gt;|\]))/', $fn, $text);

    $found = array();
    $word = explode( $char, $find );

    foreach ( $word as $test )
    { 
        $found []= preg_quote(strip_tags( $test ) );
    }

    $expr = join('|', $found); 
    $text = preg_replace("/($expr)/is", strtr($repl, array('%s' => '\\1')), $text);

    $text = preg_replace_callback('/__!(\d+)__/', $fn, $text);
    return $text;
} 
	
	public static function randomString( $length = 10, $uc = TRUE, $n = TRUE, $sc = FALSE ) {
	    $source = 'abcdefghijklmnopqrstuvwxyz';
	    if( $uc == 1 ) { $source .= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'; }
	    if( $n  == 1 ) { $source .= '1234567890'; }
	    if( $sc == 1 ) { $source .= '-_'; }//'|@#~$%()=^*+[]{}-_'; }
	    
	    if( $length > 0 ) {
	        $rstr = "";
	        $source = str_split( $source, 1 );
	        for( $i = 1; $i <= $length; ++$i ) {
	            mt_srand( (double)microtime() * 1000000 );
	            $num   = mt_rand( 1, count( $source ) );
	            $rstr .= $source[ $num - 1 ];
	        }//<-- * FOR * -->
	    }//<-- * IF * -->
	    return $rstr;
	}
	
    public static function isValidYoutubeURL( $url ) {

	    $parse = parse_url($url);
	    $host  = $parse['host'];
	    if ( !in_array( $host, array( 'youtube.com', 'www.youtube.com', 'youtu.be', 'www.youtu.be' ) ) ) {
	        return false;
	    }
	
	    $ch = curl_init();
	    $oembedURL = 'www.youtube.com/oembed?url=' . urlencode($url).'&format=json';
	    curl_setopt( $ch, CURLOPT_URL, $oembedURL );
	    curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1 );
		
		
	    $output = curl_exec( $ch );
	    //unset( $output );
	
	    $info = curl_getinfo( $ch );
	    curl_close( $ch );
	
	    if ( $info['http_code'] !== 404 ) {
			return json_decode( $output );
		}  else {
			return false;
		}
	}//<-------- FUNCTION END
	
	public static function isValidVimeoURL( $url ) {

	    $parse = parse_url($url);
	    $host  = $parse['host'];
	    if ( !in_array( $host, array( 'vimeo.com', 'player.vimeo.com' ) ) ) {
	        return false;
	    }
	
	    $ch = curl_init();
	    $oembedURL = 'vimeo.com/api/oembed.json?url=' . urlencode( $url );
	    curl_setopt( $ch, CURLOPT_URL, $oembedURL );
	    curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1 );
		
		
	    $output = curl_exec( $ch );
	    //unset( $output );
	
	    $info = curl_getinfo( $ch );
	    curl_close( $ch );
	
	    if ( $info['http_code'] !== 404 ) {
			return json_decode( $output );
		} else {
			return false;
		}
	}//<-------- FUNCTION END	
	
	public static function getYoutubeId( $url ) {
	 $pattern = 
	     '%^# Match any youtube URL
	    (?:https?://)? 
	    (?:www\.)?     
	    (?:             
	      youtu\.be/    
	    | youtube\.com  
	      (?:           
	        /embed/    
	      | /v/         
	      | .*v=        
	      )            
	    )              
	    ([\w-]{10,12})  
	    ($|&).*         
	    $%x'
	    ;
	        ;
	    $result = preg_match( $pattern, $url, $matches );
	    if ( false !== $result ) {
	        return $matches[1];
	    }
	    return false;
	}//<<<-- End
	
	public static function isValidSoundCloudURL( $url ) {

	    $parse = parse_url($url);
	    $host  = $parse['host'];
	    if ( !in_array( $host, array( 'soundcloud.com' ) ) ) {
	        return false;
	    }
	
	    $ch = curl_init();
	    $oembedURL = 'soundcloud.com/oembed/?format=json&url=' . urlencode( $url );
	    curl_setopt( $ch, CURLOPT_URL, $oembedURL );
	    curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1 );
		
		
	    $output = curl_exec( $ch );
	    //unset( $output );
	
	    $info = curl_getinfo( $ch );
	    curl_close( $ch );
	
	    if ( $info['http_code'] !== 404 ) {
			return json_decode( $output );
		} else {
			return false;
		}
	}//<-------- FUNCTION END	
	
	public static function formatNumber( $number ) {
    if( $number >= 1000 &&  $number < 1000000 ) {
       	
       return number_format( $number/1000, 1 ). "k";
    } else if( $number >= 1000000 ) {
		return number_format( $number/1000000, 1 ). "m"; 
	} else {
        return $number;
    }
   }//<<<<--- End Function
   
   public static function convertAscii( $entry ) {
		 $changes = array(
		'!' => '%21',
		'"' => '%22',
		'#' => '%23',
		'$' => '%24',
		'&' => '%26',
		"'" => '%27',
		'(' => '%28',
		')' => '%29',
		'*' => '%2A',
		'+' => '%2B',
		'-' => '%2D',
		'`' => '%60',
		'@' => '%40',
		'<' => '%3C',
		'=' => '3D',
		'>' => '3E',
		'?' => '3F',
		'^' => '5E'
		);
		
		$output = strtr( $entry , $changes );
		return $output;
	}//<<<<---- * End * ---->>>>

	
	//Languages Array
	public static function arrayLang(){
		$arrayLang = array(
		'Catalan - català' => 'ca',
		'Chinese - 繁體中文' => 'zh-tw',
		'Deutsch - German' => 'de',
		'Dutch - Nederlands' => 'nl',
		'English (US)' => 'en',
		'French - Français' => 'fr',
		'Italian - Italiano' => 'it',
		'Portuguese - Português' => 'pt',
		'Romanian - Română' => 'ro',
		'Russian - Русский' => 'ru',
		'Spanish - Español' => 'es',
		'Turkish - Türkçe' => 'tr',
		'Czech - Čeština' => 'cs',
		'Greek - Ελληνικά' => 'el'
		
		);
		return $arrayLang;
	}
	
   // getLang
    public static function getLang() {
    	
    	/* Prefix */
    	$prefix = 'lang_';
		/* Root */
		$root  = 'languages';
		//<--------- * LANGUAGE GET * ---------->
        if( isset( $_GET['lang'] ) ) {
        	
			//unset( $_SESSION['LANG'] );
            $_lang = $_GET['lang'];
			$lang =  $root . DS . $prefix.$_lang.'.php';
			
			if( is_readable( $lang ) ) {
				
				require_once $lang;
			} else {
				require_once $root . DS . $prefix.'en.php';;
			}
			
            $_SESSION['lang'] = $_lang;
			
			
        } else if ( isset( $_SESSION['lang'] ) && !isset( $_SESSION['lang_user'] ) ) {
        	$_lang = $_SESSION['lang'];
            $lang =  $root . DS . $prefix.$_lang.'.php';
			
            if( is_readable( $lang ) ) {
				
				require_once $lang;
			} else {
				require_once $root . DS . $prefix.'en.php';;
			}
			//<--------- * LANGUAGE USER DEFAULT * ---------->
        }  else if ( isset( $_SESSION['lang_user'] ) ) {
        	$_lang = $_SESSION['lang_user'];
            $lang  =  $root . DS . $prefix.$_lang.'.php';
			
            if( is_readable( $lang ) ) {
				
				require_once $lang;
			} else {
				require_once $root . DS . $prefix.'en.php';;
			}
			
            $_SESSION['lang'] = $_lang;
			
			
        } else {
          
            if ( $_SERVER['HTTP_ACCEPT_LANGUAGE'] != '' ) {
                $languages = explode(";", $_SERVER['HTTP_ACCEPT_LANGUAGE'] );
				
				$existsLang = 1;
				
				foreach ( self :: arrayLang() as $key => $value ) {
					
					/* Languages */
	                if( strpos( $languages[0], ''.$value.'' ) !== FALSE ) {
	                	$existsLang = 0;
	                	$_lang = $value;
						$lang =  $root . DS . $prefix.$_lang.'.php';
						require_once $lang;
						$_SESSION['lang'] = $_lang;
					} 
				}
				//<<<-- If not exists
				if( $existsLang == 1 ) {
					$_lang = 'en';
					$lang =  $root . DS . $prefix.$_lang.'.php';
					require_once $lang;
					$_SESSION['lang'] = $_lang;
				}
                
            } else  {
                $_lang = 'en';
				$lang =  $root . DS . $prefix.$_lang.'.php';
				require_once $lang;
				$_SESSION['lang'] = $_lang;
            }
        }
        return $lang;
    }//<--------- End getLang()
}//<------------------- * END CLASS * ----------->

?>