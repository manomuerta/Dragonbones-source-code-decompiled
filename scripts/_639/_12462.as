package _639
{
   public class _12462 extends _640
   {
      private static var instance:_12462;
      
      private static var propertyList:Array = [["autoKey",false],["timelineFilter",true],["sceneTreeFilter",true]];
      
      private var _4665:Boolean;
      
      private var _12699:Boolean;
      
      private var _12698:Boolean;
      
      public function _12462()
      {
         super();
         _5633 = "usercustom.amf";
         _5627 = "usercustomDebug.amf";
      }
      
      public static function getInstance() : _12462
      {
         if(instance == null)
         {
            instance = new _12462();
         }
         return instance;
      }
      
      public function get autoKey() : Boolean
      {
         return this._4665;
      }
      
      public function set autoKey(param1:Boolean) : void
      {
         this._4665 = param1;
         _5621("autoKey",this["autoKey"]);
      }
      
      public function get timelineFilter() : Boolean
      {
         return this._12699;
      }
      
      public function set timelineFilter(param1:Boolean) : void
      {
         this._12699 = param1;
         _5621("timelineFilter",this["timelineFilter"]);
      }
      
      public function get sceneTreeFilter() : Boolean
      {
         return this._12698;
      }
      
      public function set sceneTreeFilter(param1:Boolean) : void
      {
         this._12698 = param1;
         _5621("sceneTreeFilter",this["sceneTreeFilter"]);
      }
      
      public function _1664() : void
      {
         var _loc1_:Object = null;
         var _loc2_:Array = null;
         for each(_loc2_ in propertyList)
         {
            _loc1_ = _5629(_loc2_[0]);
            this[_loc2_[0]] = _loc1_ != null ? _loc1_ : _loc2_[1];
         }
      }
      
      public function _3525() : void
      {
         var _loc1_:Array = null;
         for each(_loc1_ in propertyList)
         {
            _5628(_loc1_[0],this[_loc1_[0]]);
         }
         save(true);
      }
   }
}

