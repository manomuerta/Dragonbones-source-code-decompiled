package _1146
{
   import _1162._1164;
   import egret.core.ns_egret;
   
   use namespace ns_egret;
   
   public class _1153 extends Effect
   {
      private var _8823:Array;
      
      private var _5822:Array;
      
      public function _1153(param1:Object = null)
      {
         this._5822 = [];
         super(param1);
         _8757 = _1164;
      }
      
      public function get children() : Array
      {
         return this._5822;
      }
      
      public function set children(param1:Array) : void
      {
         var _loc2_:int = 0;
         if(this._5822)
         {
            _loc2_ = 0;
            while(_loc2_ < this._5822.length)
            {
               if(this._5822[_loc2_])
               {
                  Effect(this._5822[_loc2_]).ns_egret::_8765 = null;
               }
               _loc2_++;
            }
         }
         this._5822 = param1;
         if(this._5822)
         {
            _loc2_ = 0;
            while(_loc2_ < this._5822.length)
            {
               if(this._5822[_loc2_])
               {
                  Effect(this._5822[_loc2_]).ns_egret::_8765 = this;
               }
               _loc2_++;
            }
         }
      }
      
      public function get _8310() : Number
      {
         return duration;
      }
      
      override public function _8777(param1:Object = null) : _1172
      {
         if(!this._8823)
         {
            this._8823 = [param1];
         }
         var _loc2_:_1172 = super._8777(param1);
         this._8823 = null;
         return _loc2_;
      }
      
      override public function _8822(param1:Array = null) : Array
      {
         if(!param1)
         {
            param1 = this.targets;
         }
         this._8823 = param1;
         var _loc2_:_1172 = this._8777();
         this._8823 = null;
         return !!_loc2_ ? [_loc2_] : [];
      }
      
      override protected function _8760(param1:_1172) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Effect = null;
         super._8760(param1);
         var _loc2_:_1164 = _1164(param1);
         var _loc3_:Object = this._8823;
         if(!(_loc3_ is Array))
         {
            _loc3_ = [_loc3_];
         }
         if(this.children)
         {
            _loc4_ = int(this.children.length);
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc6_ = this.children[_loc5_];
               if(_loc6_.targets.length == 0)
               {
                  _loc2_._8824(this.children[_loc5_]._8822(_loc3_));
               }
               else
               {
                  _loc2_._8824(this.children[_loc5_]._8822(_loc6_.targets));
               }
               _loc5_++;
            }
         }
      }
      
      public function addChild(param1:Effect) : void
      {
         this.children.push(param1);
         Effect(param1).ns_egret::_8765 = this;
      }
   }
}

