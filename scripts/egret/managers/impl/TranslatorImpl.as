package egret.managers.impl
{
   import egret.managers.ITranslator;
   import flash.utils.ByteArray;
   
   public class TranslatorImpl implements ITranslator
   {
      private var textMap:Object;
      
      public function TranslatorImpl()
      {
         this.textMap = {};
         super();
      }
      
      public function getText(param1:String, param2:Array = null) : String
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this.textMap[param1] != undefined)
         {
            _loc3_ = this.textMap[param1];
         }
         else
         {
            _loc3_ = param1;
         }
         if(param2)
         {
            _loc4_ = int(param2.length);
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc3_ = _loc3_.replace("{" + _loc5_ + "}",param2[_loc5_]);
               _loc5_++;
            }
         }
         return _loc3_.split("\\n").join("\n");
      }
      
      public function addLocaleConfig(param1:*) : void
      {
         var byteDataTxt:ByteArray = null;
         var languageStr:String = null;
         var item:XML = null;
         var key:String = null;
         var value:String = null;
         var config:* = param1;
         if(!config)
         {
            return;
         }
         if(config is Class)
         {
            try
            {
               byteDataTxt = new config();
               languageStr = byteDataTxt.readUTFBytes(byteDataTxt.bytesAvailable);
               config = new XML(languageStr);
            }
            catch(error:Error)
            {
               return;
            }
         }
         if(config is XML)
         {
            for each(item in config.item)
            {
               key = String(item.@key);
               value = String(item.@value);
               this.textMap[key] = value;
            }
         }
      }
   }
}

