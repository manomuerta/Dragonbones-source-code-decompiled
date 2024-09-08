package _13515
{
   import _13492._13496;
   import _13492._13498;
   import _13492._13499;
   import _13505._13510;
   import _1404._1407;
   import _51._52;
   import _555._576;
   import _573.TimelinePanelController;
   import _81._86;
   import _93._92;
   import flash.geom.Point;
   
   public class _13525 extends _92
   {
      private var _3108:Vector.<_92>;
      
      public function _13525()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_13496 = null;
         var _loc5_:Object = null;
         var _loc6_:_13532 = null;
         var _loc7_:_13498 = null;
         var _loc8_:Point = null;
         var _loc9_:_13499 = null;
         var _loc10_:_13498 = null;
         var _loc11_:Point = null;
         var _loc12_:Object = null;
         var _loc13_:_13521 = null;
         var _loc14_:Object = null;
         var _loc15_:_13531 = null;
         super._1572(param1);
         this._3108 = new Vector.<_92>();
         _loc2_ = 0;
         _loc3_ = int(this.frames.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this.frames[_loc2_];
            (_loc5_ = {})._1946 = _loc4_;
            switch(this.flag)
            {
               case _13510.FLAG_TRANSLATE:
                  _loc7_ = _loc4_ as _13498;
                  _loc8_ = new Point(_loc7_._13638.x + this._11297.x,_loc7_._13638.y + this._11297.y);
                  _loc5_.newValue = _loc8_;
                  _loc5_.oldValue = _loc7_._13638;
                  break;
               case _13510.FLAG_ROTATE:
                  _loc9_ = _loc4_ as _13499;
                  _loc5_.newValue = _loc9_._13639 + this._11297.rotation;
                  _loc5_.oldValue = _loc9_._13639;
                  break;
               case _13510.FLAG_SCALE:
                  _loc10_ = _loc4_ as _13498;
                  _loc11_ = new Point(_loc10_._13638.x * this._11297.scaleX,_loc10_._13638.y * this._11297.scaleY);
                  _loc5_.newValue = _loc11_;
                  _loc5_.oldValue = _loc10_._13638;
                  break;
            }
            _loc6_ = new _13532();
            _loc6_._1572(_loc5_);
            this._3108.push(_loc6_);
            _loc2_++;
         }
         if(this._13703)
         {
            (_loc12_ = {})._1945 = this._13709;
            _loc12_._1946 = this._13712;
            _loc13_ = new _13521();
            _loc13_._1572(_loc12_);
            this._3108.push(_loc13_);
         }
         else if(this._13713)
         {
            (_loc14_ = {}).flag = this.flag;
            _loc14_._1836 = this._1836;
            _loc14_._2977 = this._2977;
            _loc14_._2976 = this._1836._2002;
            _loc15_ = new _13531();
            _loc15_._1572(_loc14_);
            this._3108.push(_loc15_);
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._3108.length);
         while(_loc1_ < _loc2_)
         {
            this._3108[_loc1_].execute();
            _loc1_++;
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc1_:int = 0;
         _loc1_ = int(this._3108.length - 1);
         while(_loc1_ >= 0)
         {
            this._3108[_loc1_].revert();
            _loc1_--;
         }
         this._2894();
      }
      
      public function _2894() : void
      {
         this._2852.refresh();
         this._2852._3140();
         this._2852._3002();
         _576(_1407.getInstance(_576)).refresh();
      }
      
      private function get _1836() : _52
      {
         return _2223._1836;
      }
      
      private function get _2977() : _86
      {
         return _2223._2977;
      }
      
      private function get _13711() : _86
      {
         return _2223._13711;
      }
      
      private function get _11297() : _86
      {
         return _2223._11297;
      }
      
      private function get frames() : Vector.<_13496>
      {
         return _2223.frames;
      }
      
      private function get flag() : String
      {
         return _2223.flag;
      }
      
      private function get _13713() : Boolean
      {
         return _2223._13713;
      }
      
      private function get _13703() : Boolean
      {
         return _2223._13703;
      }
      
      private function get _13712() : _13496
      {
         return _2223._13712;
      }
      
      private function get _13709() : _13510
      {
         return _2223._13709;
      }
      
      protected function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

