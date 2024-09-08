package _11910
{
   import _11845._11949;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   
   public class _11922 extends _11944
   {
      public static const API:Number = 2;
      
      protected var _target:Object;
      
      protected var _type:Class;
      
      protected var _filter:BitmapFilter;
      
      protected var _6954:int;
      
      protected var _12031:Boolean;
      
      private var _12318:_11949;
      
      public function _11922(param1:String = "", param2:Number = 0)
      {
         super(param1,param2);
      }
      
      protected function _12286(param1:*, param2:Object, param3:_11949, param4:Class, param5:BitmapFilter, param6:Array) : Boolean
      {
         var _loc8_:String = null;
         var _loc9_:int = 0;
         var _loc10_:_11928 = null;
         this._target = param1;
         this._12318 = param3;
         this._type = param4;
         var _loc7_:Array = this._target.filters;
         var _loc11_:Object = param2 is BitmapFilter ? {} : param2;
         if(_loc11_.index != null)
         {
            this._6954 = _loc11_.index;
         }
         else
         {
            this._6954 = _loc7_.length;
            if(_loc11_.addFilter != true)
            {
               while(--this._6954 > -1 && !(_loc7_[this._6954] is this._type))
               {
               }
            }
         }
         if(this._6954 < 0 || !(_loc7_[this._6954] is this._type))
         {
            if(this._6954 < 0)
            {
               this._6954 = _loc7_.length;
            }
            if(this._6954 > _loc7_.length)
            {
               _loc9_ = int(_loc7_.length - 1);
               while(++_loc9_ < this._6954)
               {
                  _loc7_[_loc9_] = new BlurFilter(0,0,1);
               }
            }
            _loc7_[this._6954] = param5;
            this._target.filters = _loc7_;
         }
         this._filter = _loc7_[this._6954];
         this._12031 = _loc11_.remove == true;
         _loc9_ = int(param6.length);
         while(--_loc9_ > -1)
         {
            _loc8_ = param6[_loc9_];
            if(_loc8_ in param2 && this._filter[_loc8_] != param2[_loc8_])
            {
               if(_loc8_ == "color" || _loc8_ == "highlightColor" || _loc8_ == "shadowColor")
               {
                  _loc10_ = new _11928();
                  _loc10_._12338(this._filter,_loc8_,param2[_loc8_]);
                  _12285(_loc10_,"setRatio",0,1,_12315);
               }
               else if(_loc8_ == "quality" || _loc8_ == "inner" || _loc8_ == "knockout" || _loc8_ == "hideObject")
               {
                  this._filter[_loc8_] = param2[_loc8_];
               }
               else
               {
                  _12285(this._filter,_loc8_,this._filter[_loc8_],param2[_loc8_],_12315);
               }
            }
         }
         return true;
      }
      
      override public function setRatio(param1:Number) : void
      {
         super.setRatio(param1);
         var _loc2_:Array = this._target.filters;
         if(!(_loc2_[this._6954] is this._type))
         {
            this._6954 = _loc2_.length;
            while(--this._6954 > -1 && !(_loc2_[this._6954] is this._type))
            {
            }
            if(this._6954 == -1)
            {
               this._6954 = _loc2_.length;
            }
         }
         if(param1 == 1 && this._12031 && this._12318._12035 == this._12318._1892 && this._12318.data != "isFromStart")
         {
            if(this._6954 < _loc2_.length)
            {
               _loc2_.splice(this._6954,1);
            }
         }
         else
         {
            _loc2_[this._6954] = this._filter;
         }
         this._target.filters = _loc2_;
      }
   }
}

