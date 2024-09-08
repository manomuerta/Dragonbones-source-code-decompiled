package _13515
{
   import _1404._1407;
   import _555._576;
   import _573.TimelinePanelController;
   import _93._92;
   
   public class _13516 extends _92
   {
      private var _3108:Vector.<_92>;
      
      public function _13516()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:_13514 = null;
         this._3108 = new Vector.<_92>();
         super._1572(param1);
         var _loc2_:Array = param1;
         _loc3_ = 0;
         _loc4_ = int(_loc2_.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = new _13514();
            _loc5_._1572(_loc2_[_loc3_]);
            this._3108.push(_loc5_);
            _loc3_++;
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
         this._2852._3133();
         this._2852.refresh();
         this._2852._3002();
         this._2852._3140();
         _576(_1407.getInstance(_576)).refresh();
      }
      
      protected function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

