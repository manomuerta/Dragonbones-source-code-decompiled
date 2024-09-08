package _14188
{
   import _14229.StyleDeclarationEvent;
   import _14240.StringUtil;
   import flash.events.EventDispatcher;
   
   public class _14187 extends EventDispatcher
   {
      private var _15180:Object;
      
      private var _15179:Array;
      
      public function _14187()
      {
         this._15180 = {};
         this._15179 = [];
         super();
      }
      
      public static function _15182(param1:String) : _14187
      {
         var _loc2_:_14187 = new _14187();
         _loc2_.fromString(param1);
         return _loc2_;
      }
      
      public function _15181(param1:String) : String
      {
         return this._15180[param1];
      }
      
      public function setProperty(param1:String, param2:String) : void
      {
         var _loc3_:String = null;
         if(this._15180[param1] != param2)
         {
            _loc3_ = this._15180[param1];
            this._15180[param1] = param2;
            this._15185(param1);
            dispatchEvent(new StyleDeclarationEvent(StyleDeclarationEvent.PROPERTY_CHANGE,param1,_loc3_,param2));
         }
      }
      
      public function _15184(param1:String) : String
      {
         var _loc2_:String = this._15180[param1];
         delete this._15180[param1];
         this._15183(param1);
         dispatchEvent(new StyleDeclarationEvent(StyleDeclarationEvent.PROPERTY_CHANGE,param1,_loc2_,null));
         return _loc2_;
      }
      
      public function hasProperty(param1:String) : Boolean
      {
         var _loc2_:int = int(this._15179.indexOf(param1));
         return _loc2_ != -1;
      }
      
      public function get length() : int
      {
         return this._15179.length;
      }
      
      public function item(param1:int) : String
      {
         return this._15179[param1];
      }
      
      public function fromString(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc3_:Array = null;
         param1 = StringUtil.trim(param1);
         param1 = StringUtil.rtrim(param1,";");
         for each(_loc2_ in param1.split(";"))
         {
            _loc3_ = _loc2_.split(":");
            if(_loc3_.length == 2)
            {
               this.setProperty(StringUtil.trim(_loc3_[0]),StringUtil.trim(_loc3_[1]));
            }
         }
      }
      
      override public function toString() : String
      {
         var _loc2_:String = null;
         var _loc1_:String = "";
         for each(_loc2_ in this._15179)
         {
            _loc1_ += _loc2_ + ":" + this._15180[_loc2_] + "; ";
         }
         return _loc1_;
      }
      
      public function clear() : void
      {
         while(this.length > 0)
         {
            this._15184(this.item(0));
         }
      }
      
      public function _15186(param1:_14187) : void
      {
         var _loc2_:String = null;
         for each(_loc2_ in this._15179)
         {
            param1.setProperty(_loc2_,this._15181(_loc2_));
         }
      }
      
      public function _15187(param1:_14187) : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         for each(_loc2_ in this._15179)
         {
            param1.setProperty(_loc2_,this._15181(_loc2_));
         }
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ = param1.item(_loc3_);
            if(!this.hasProperty(_loc2_))
            {
               param1._15184(_loc2_);
            }
            _loc3_++;
         }
      }
      
      private function _15185(param1:String) : void
      {
         if(this._15179.indexOf(param1) == -1)
         {
            this._15179.push(param1);
         }
      }
      
      private function _15183(param1:String) : void
      {
         var _loc2_:int = int(this._15179.indexOf(param1));
         if(_loc2_ != -1)
         {
            this._15179.splice(_loc2_,1);
         }
      }
   }
}

