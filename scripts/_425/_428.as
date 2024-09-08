package _425
{
   import _413._437;
   import _413._457;
   import _93._92;
   
   public class _428 extends _92
   {
      private var _3414:Vector.<_92>;
      
      public function _428()
      {
         this._3414 = new Vector.<_92>();
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc5_:_457 = null;
         var _loc6_:_432 = null;
         super._1572(param1);
         var _loc2_:_437 = new _437();
         _loc2_._1572(_2223.deleteFrames);
         this._3414.push(_loc2_);
         if(_2223._3413)
         {
            _loc5_ = new _457();
            _loc5_._1572(_2223._3413);
            this._3414.push(_loc5_);
         }
         var _loc3_:int = 0;
         var _loc4_:int = int(_2223.pasteFrames.length);
         while(_loc3_ < _loc4_)
         {
            _loc6_ = new _432();
            _loc6_._1572(_2223.pasteFrames[_loc3_]);
            this._3414.push(_loc6_);
            _loc3_++;
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = int(this._3414.length);
         while(_loc1_ < _loc2_)
         {
            this._3414[_loc1_].execute();
            _loc1_++;
         }
      }
      
      override public function revert() : void
      {
         var _loc1_:int = int(this._3414.length - 1);
         while(_loc1_ >= 0)
         {
            this._3414[_loc1_].revert();
            _loc1_--;
         }
      }
   }
}

