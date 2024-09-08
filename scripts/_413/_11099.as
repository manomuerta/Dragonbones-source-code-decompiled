package _413
{
   import _13515._13521;
   import _1404._1407;
   import _573.TimelinePanelController;
   import _93._92;
   
   public class _11099 extends _92
   {
      private var _3414:Vector.<_92>;
      
      public function _11099()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_457 = null;
         var _loc5_:_13521 = null;
         super._1572(param1);
         this._3414 = new Vector.<_92>();
         if(this._11129.moveFrame)
         {
            _loc4_ = new _457();
            _loc4_._1572(this._11129.moveFrame);
            this._3414.push(_loc4_);
         }
         if(this._11129._11134)
         {
            _loc2_ = 0;
            _loc3_ = int(this._11129._11134.length);
            while(_loc2_ < _loc3_)
            {
               _loc5_ = new _13521();
               _loc5_._1572(this._11129._11134[_loc2_]);
               this._3414.push(_loc5_);
               _loc2_++;
            }
         }
      }
      
      override public function execute() : void
      {
         super.execute();
         var _loc1_:int = 0;
         var _loc2_:int = int(this._3414.length);
         while(_loc1_ < _loc2_)
         {
            this._3414[_loc1_].execute();
            _loc1_++;
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         var _loc1_:int = int(this._3414.length - 1);
         while(_loc1_ >= 0)
         {
            this._3414[_loc1_].revert();
            _loc1_--;
         }
         this._2894();
      }
      
      private function _2894() : void
      {
         this._2852.refresh();
      }
      
      private function get _11129() : _11100
      {
         return _2223 as _11100;
      }
      
      private function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

