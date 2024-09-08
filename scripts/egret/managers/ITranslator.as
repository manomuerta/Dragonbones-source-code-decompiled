package egret.managers
{
   public interface ITranslator
   {
      function getText(param1:String, param2:Array = null) : String;
      
      function addLocaleConfig(param1:*) : void;
   }
}

