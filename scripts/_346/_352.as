package _346
{
   import _1404._1407;
   import _625._627;
   import _93._92;
   import flash.utils.Dictionary;
   
   public class _352 extends _92
   {
      public function _352()
      {
         super();
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
      }
      
      override public function execute() : void
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc1_:Dictionary = new Dictionary();
         var _loc2_:_627 = _1407.getInstance(_627) as _627;
         (_2223 as Array).shift();
         for each(_loc3_ in _2223)
         {
            _loc4_ = _loc3_.split("=");
            _loc1_[_loc4_[0].toLowerCase()] = _loc4_[1];
         }
         if(Boolean(_loc1_.hasOwnProperty("ismin")) && _loc1_["ismin"] == "true")
         {
            _loc2_._1559.application.minimize();
         }
         if(_loc1_.hasOwnProperty("dbdatapack"))
         {
            _loc2_._3243(_loc1_);
         }
         else
         {
            _loc2_._3242(_loc1_);
         }
      }
   }
}

