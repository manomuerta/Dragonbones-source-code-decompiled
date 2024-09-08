package _12465
{
   import _1529._1528;
   import _1529._1530;
   import flash.utils.getTimer;
   
   public class _12466
   {
      public static const DAY30:uint = 3600 * 24 * 30;
      
      public static const IN_PRESELL:int = 0;
      
      public static const BEFORE_PRESELL:int = 1;
      
      public static const AFTER_PRESELL:int = 2;
      
      public var initialized:Boolean = false;
      
      private var _13022:Number;
      
      private var _13024:Number;
      
      public var items:Vector.<_12467>;
      
      private var _12018:uint;
      
      private var _13020:uint;
      
      private var _13019:uint;
      
      public function _12466()
      {
         this.items = new Vector.<_12467>();
         super();
         this._13020 = new Date().time / 1000;
         this._13019 = this._13020 + DAY30;
      }
      
      public function _2838(param1:Object) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this._13020 = param1.curTime;
         this._13019 = param1.endTime;
         this._12018 = getTimer();
         this._13022 = param1["rmb_price"];
         this._13024 = param1["usd_price"];
         if(_1528.language == _1530.zh_CN)
         {
            _12467._12721 = this._13022;
         }
         else
         {
            _12467._12721 = this._13024;
         }
         var _loc2_:Array = param1["goods_info"];
         if(Boolean(_loc2_) && _loc2_.length > 0)
         {
            _loc3_ = 0;
            _loc4_ = int(_loc2_.length);
            while(_loc3_ < _loc4_)
            {
               this.items.push(new _12467(_loc2_[_loc3_]["goods_id"],_loc2_[_loc3_]["goods_en_descript"],_loc2_[_loc3_]["goods_zh_descript"],_loc2_[_loc3_]["goods_en_name"],_loc2_[_loc3_]["goods_name"],_loc2_[_loc3_]["goods_num"],_loc2_[_loc3_]["goods_rmb_price"],_loc2_[_loc3_]["goods_usd_price"],_loc2_[_loc3_]["goods_stock_left"],_loc2_[_loc3_]["goods_stock_num"],_1528.language));
               _loc3_++;
            }
         }
         this.initialized = true;
      }
      
      public function _13007() : uint
      {
         if(this.initialized)
         {
            if(this._13019 > this.curTime + DAY30)
            {
               return BEFORE_PRESELL;
            }
            if(this._13019 > this.curTime)
            {
               return IN_PRESELL;
            }
         }
         return AFTER_PRESELL;
      }
      
      public function get curTime() : uint
      {
         return this._13020 + int((getTimer() - this._12018) / 1000);
      }
      
      public function get _13023() : uint
      {
         var _loc1_:int = Math.ceil((this._13019 - this.curTime) / (3600 * 24));
         return _loc1_ > 0 ? uint(_loc1_) : 1;
      }
      
      public function _13021() : uint
      {
         return this.curTime > this._13019 ? this.curTime : this._13019;
      }
      
      public function _13953() : String
      {
         var _loc1_:* = null;
         var _loc2_:Date = new Date(this._13019 * 1000);
         if(_1528.language == _1530.zh_CN)
         {
            _loc1_ = String(_loc2_.getFullYear()) + "年" + String(_loc2_.getMonth() + 1) + "月" + String(_loc2_.getDate()) + "日";
         }
         else
         {
            _loc1_ = _loc2_.toLocaleDateString();
            _loc1_ = _loc1_.slice(_loc1_.search(" "));
         }
         return _loc1_;
      }
   }
}

