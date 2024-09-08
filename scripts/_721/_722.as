package _721
{
   import _35._37;
   import _51._50;
   import _51._71;
   import _521._527;
   import _648.PluginModel;
   import _648._665;
   import _73.SymbolType;
   import _97._101;
   import flash.display.BitmapData;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.utils.ByteArray;
   
   public class _722
   {
      public static const TYPE_TEXTURE:int = 0;
      
      public static const TYPE_ZIP:int = 1;
      
      public static const TYPE_PNG:int = 2;
      
      public static const TYPE_FILES:int = 3;
      
      public static const TYPE_DBSWF:int = 4;
      
      public var type:int;
      
      public var _3271:Boolean;
      
      public var projectPath:String;
      
      public var projectName:String;
      
      public var _3280:String;
      
      public var _3714:String;
      
      public var texturePath:String;
      
      public var textureConfigPath:String;
      
      public var _3736:String;
      
      public var _5500:String;
      
      public var outputPath:String;
      
      public var _5512:String;
      
      public var libraryPath:String;
      
      public var _5493:String;
      
      public var _5484:String;
      
      public var _3712:Object;
      
      public var _5871:_37;
      
      public var _5490:Object;
      
      public var _5872:BitmapData;
      
      public var _1717:Object;
      
      public var _3274:_71;
      
      public var _3737:String;
      
      public var _3724:Array;
      
      public var _3725:Array;
      
      public var _3282:Array;
      
      public var _2871:_665;
      
      public var _3717:PluginModel;
      
      public function _722()
      {
         super();
         this._2871 = new _665();
      }
      
      public function saveFile() : Boolean
      {
         var fileObj:Object = null;
         var i:int = 0;
         var len:int = 0;
         var file:File = null;
         var fileStream:FileStream = null;
         try
         {
            i = 0;
            len = int(this._3282.length);
            while(i < len)
            {
               fileObj = this._3282[i];
               file = File.documentsDirectory.resolvePath(fileObj.path);
               fileStream = new FileStream();
               fileStream.open(file,FileMode.WRITE);
               fileStream.writeBytes(fileObj.content as ByteArray);
               _527.getInstance()._2377("Save:: " + fileObj.path);
               fileStream.close();
               i++;
            }
            this._3282 = null;
            return true;
         }
         catch(e:Error)
         {
            _527.getInstance()._2377("ErrorSave:: " + fileObj.path);
            return false;
         }
      }
      
      public function get _1832() : Boolean
      {
         if(this._1717 is XML)
         {
            return int(this._1717[_101.BASIC_ANIMATION]) == 1;
         }
         return Boolean(this._1717[_101.BASIC_ANIMATION]);
      }
      
      public function _5496() : String
      {
         if(this._3737 != null && this._3737 != "")
         {
            return this._3737;
         }
         if(this._1717 is XML)
         {
            return String(this._1717[_101.A_VERSION]);
         }
         return String(this._1717[_101.A_VERSION]);
      }
      
      public function get _3727() : String
      {
         if(this._3271)
         {
            return this.libraryPath;
         }
         return this.outputPath + "library/";
      }
      
      public function _3279() : Boolean
      {
         var _loc1_:_50 = null;
         if(this._3274 != null)
         {
            if(this._3274._2126.length != 1)
            {
               return false;
            }
            _loc1_ = this._3274._2126[0];
            if(_loc1_)
            {
               if(_loc1_._13619.length == 0 && _loc1_._1811 != SymbolType.COMIC)
               {
                  return true;
               }
            }
         }
         return false;
      }
   }
}

