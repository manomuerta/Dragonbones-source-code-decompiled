package _11846
{
   public class _11848 extends Animation
   {
      public var _12041:Boolean;
      
      public var smoothChildTiming:Boolean;
      
      public var _12014:Boolean;
      
      public var _3072:Animation;
      
      public var _12042:Animation;
      
      public function _11848(param1:Object = null)
      {
         super(0,param1);
         this._12041 = this.smoothChildTiming = true;
      }
      
      public function insert(param1:*, param2:* = 0) : *
      {
         return this.add(param1,param2 || 0);
      }
      
      public function add(param1:*, param2:* = "+=0", param3:String = "normal", param4:Number = 0) : *
      {
         var _loc6_:Number = NaN;
         param1._12018 = Number(param2 || 0) + param1._11589;
         if(param1._12030)
         {
            if(this != param1._12024)
            {
               param1._12021 = param1._12018 + (this._12032() - param1._12018) / param1._12020;
            }
         }
         if(param1.timeline)
         {
            param1.timeline._12031(param1,true);
         }
         param1.timeline = param1._12024 = this;
         if(param1._12039)
         {
            param1._5142(true,true);
         }
         var _loc5_:Animation = this._12042;
         if(this._12014)
         {
            _loc6_ = Number(param1._12018);
            while(Boolean(_loc5_) && _loc5_._12018 > _loc6_)
            {
               _loc5_ = _loc5_._12036;
            }
         }
         if(_loc5_)
         {
            param1._next = _loc5_._next;
            _loc5_._next = Animation(param1);
         }
         else
         {
            param1._next = this._3072;
            this._3072 = Animation(param1);
         }
         if(param1._next)
         {
            param1._next._12036 = param1;
         }
         else
         {
            this._12042 = Animation(param1);
         }
         param1._12036 = _loc5_;
         if(_12024)
         {
            _12027(true);
         }
         return this;
      }
      
      public function _12031(param1:Animation, param2:Boolean = false) : *
      {
         if(param1.timeline == this)
         {
            if(!param2)
            {
               param1._5142(false,true);
            }
            if(param1._12036)
            {
               param1._12036._next = param1._next;
            }
            else if(this._3072 === param1)
            {
               this._3072 = param1._next;
            }
            if(param1._next)
            {
               param1._next._12036 = param1._12036;
            }
            else if(this._12042 === param1)
            {
               this._12042 = param1._12036;
            }
            param1._next = param1._12036 = param1.timeline = null;
            if(_12024)
            {
               _12027(true);
            }
         }
         return this;
      }
      
      override public function render(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc5_:Animation = null;
         var _loc4_:Animation = this._3072;
         _6907 = _12035 = _12015 = param1;
         while(_loc4_)
         {
            _loc5_ = _loc4_._next;
            if(_loc4_._active || param1 >= _loc4_._12018 && !_loc4_._12030)
            {
               if(!_loc4_._12025)
               {
                  _loc4_.render((param1 - _loc4_._12018) * _loc4_._12020,param2,param3);
               }
               else
               {
                  _loc4_.render((!_loc4_._12033 ? _loc4_._12010 : _loc4_._11952()) - (param1 - _loc4_._12018) * _loc4_._12020,param2,param3);
               }
            }
            _loc4_ = _loc5_;
         }
      }
      
      public function _12032() : Number
      {
         return _6907;
      }
   }
}

