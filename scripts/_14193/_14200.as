package _14193
{
   import _14190._14189;
   import _14190._14191;
   import _14201._14219;
   import _14236._14237;
   import _14240._14245;
   import _14240._14246;
   import _14240._14248;
   import com.lorentz.SVG._14234;
   import flash.display.DisplayObject;
   
   use namespace _14234;
   
   public class _14200 extends _14198
   {
      private var _15314:String;
      
      private var _15315:String;
      
      private var _15310:_14219;
      
      protected var _15302:Vector.<DisplayObject>;
      
      private var _15307:Vector.<Object>;
      
      public function _14200(param1:String)
      {
         this._15307 = new Vector.<Object>();
         super(param1);
         if(this is _14219)
         {
            this._15310 = this as _14219;
         }
      }
      
      public function get _15196() : String
      {
         return this._15314;
      }
      
      public function set _15196(param1:String) : void
      {
         if(this._15314 != param1)
         {
            this._15314 = param1;
            this._15272();
         }
      }
      
      public function get _15197() : String
      {
         return this._15315;
      }
      
      public function set _15197(param1:String) : void
      {
         if(this._15315 != param1)
         {
            this._15315 = param1;
            this._15272();
         }
      }
      
      protected function get _15312() : _14219
      {
         return this._15310;
      }
      
      override protected function _15232(param1:_14197) : void
      {
         var _loc2_:_14197 = null;
         super._15232(param1);
         if(!(this is _14219))
         {
            _loc2_ = param1;
            while(!(_loc2_ is _14219) && _loc2_ != null)
            {
               _loc2_ = _loc2_._15247;
            }
            this._15310 = _loc2_ as _14219;
         }
      }
      
      public function _15305(param1:Object) : void
      {
         this._15297(param1,this._15300);
      }
      
      public function _15297(param1:Object, param2:int) : void
      {
         this._15307.splice(param2,0,param1);
         if(param1 is _14197)
         {
            _15201(param1 as _14197);
         }
         this._15272();
      }
      
      public function _15298(param1:int) : Object
      {
         return this._15307[param1];
      }
      
      public function get _15300() : int
      {
         return this._15307.length;
      }
      
      public function _15296(param1:int) : void
      {
         if(param1 < 0 || param1 >= this._15300)
         {
            return;
         }
         var _loc2_:Object = this._15307[param1];
         if(_loc2_ is _14197)
         {
            _15200(_loc2_ as _14197);
         }
         this._15272();
      }
      
      override public function _15272() : void
      {
         super._15272();
         if(Boolean(this._15312) && this._15312 != this)
         {
            this._15312._15272();
         }
      }
      
      override protected function _15244(param1:String, param2:String, param3:String) : void
      {
         super._15244(param1,param2,param3);
         switch(param1)
         {
            case "font-size":
            case "font-family":
            case "font-weight":
               this._15272();
         }
      }
      
      protected function _15299(param1:String, param2:_14237) : _14189
      {
         var _loc3_:String = _14248._15295(param1);
         if(_loc3_ == "rl")
         {
            param1 = String.fromCharCode(8207) + param1 + String.fromCharCode(8207);
         }
         else if(_loc3_ == "lr")
         {
            param1 = String.fromCharCode(8206) + param1 + String.fromCharCode(8206);
         }
         var _loc4_:_14191;
         (_loc4_ = new _14191())._15188 = document._15188;
         _loc4_.fontSize = _15257(_15259._15181("font-size") || "medium");
         _loc4_.fontFamily = String(_15259._15181("font-family") || document._15301);
         _loc4_.fontWeight = _15259._15181("font-weight") || "normal";
         _loc4_.fontStyle = _15259._15181("font-style") || "normal";
         if(document._15293 != null)
         {
            document._15293(_loc4_);
         }
         if(!this._15304)
         {
            _loc4_.color = this._15308();
         }
         var _loc5_:_14189 = param2._15313(this,param1,_loc4_);
         if(!this._15304)
         {
            if(_15280)
            {
               _loc5_.displayObject.alpha = this._15303();
            }
            else
            {
               _loc5_.displayObject.alpha = 0;
            }
         }
         _loc5_.direction = _loc3_;
         return _loc5_;
      }
      
      protected function get _15304() : Boolean
      {
         var _loc1_:String = _15259._15181("fill");
         return Boolean(_loc1_) && _loc1_.indexOf("url") != -1;
      }
      
      private function _15308() : uint
      {
         var _loc1_:String = _15259._15181("fill");
         if(_loc1_ == null || _loc1_.indexOf("url") > -1)
         {
            return 0;
         }
         return _14245._15276(_loc1_);
      }
      
      private function _15303() : Number
      {
         return Number(_15259._15181("fill-opacity") || 1);
      }
      
      protected function _15294() : String
      {
         var _loc1_:String = _15259._15181("direction");
         if(_loc1_)
         {
            switch(_loc1_)
            {
               case "ltr":
                  return "lr";
               case "tlr":
                  return "rl";
            }
         }
         var _loc2_:String = _15259._15181("writing-mode");
         switch(_loc2_)
         {
            case "lr":
            case "lr-tb":
               return "lr";
            case "rl":
            case "rl-tb":
               return "rl";
            case "tb":
            case "tb-rl":
               return "tb";
            default:
               return null;
         }
      }
      
      public function _15306(param1:String, param2:Number, param3:Number) : void
      {
         var _loc4_:String = _15259._15181("text-anchor") || "start";
         var _loc5_:Number = _15258(this._15196,_14246.WIDTH);
         var _loc6_:Number = 0;
         if(param1 == "lr")
         {
            if(_loc4_ == "start")
            {
               _loc6_ += _loc5_ - param2;
            }
            if(_loc4_ == "middle")
            {
               _loc6_ += _loc5_ - (param3 + param2) / 2;
            }
            else if(_loc4_ == "end")
            {
               _loc6_ += _loc5_ - param3;
            }
         }
         else
         {
            if(_loc4_ == "start")
            {
               _loc6_ += _loc5_ - param3;
            }
            if(_loc4_ == "middle")
            {
               _loc6_ += _loc5_ - (param3 + param2) / 2;
            }
            else if(_loc4_ == "end")
            {
               _loc6_ += _loc5_ - param2;
            }
         }
         this.offset(_loc6_);
      }
      
      public function offset(param1:Number) : void
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:_14200 = null;
         if(this._15302 == null)
         {
            return;
         }
         for each(_loc2_ in this._15302)
         {
            if(_loc2_ is _14200)
            {
               _loc3_ = _loc2_ as _14200;
               if(!_loc3_._15196)
               {
                  _loc3_.offset(param1);
               }
            }
            else
            {
               _loc2_.x += param1;
            }
         }
      }
      
      public function _15309() : Boolean
      {
         return style._15181("fill") != null && style._15181("fill") != "" && style._15181("fill") != "none";
      }
      
      override public function clone(param1:Boolean = true) : _14197
      {
         var _loc4_:Object = null;
         var _loc2_:_14200 = super.clone(param1) as _14200;
         var _loc3_:int = 0;
         while(_loc3_ < this._15300)
         {
            _loc4_ = this._15298(_loc3_);
            if(_loc4_ is String)
            {
               _loc2_._15305(_loc4_);
            }
            else if(_loc4_ is _14197)
            {
               _loc2_._15305((_loc4_ as _14197).clone());
            }
            _loc3_++;
         }
         return _loc2_;
      }
   }
}

