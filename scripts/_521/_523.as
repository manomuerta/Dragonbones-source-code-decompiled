package _521
{
   import _51._79;
   import _644._646;
   import _783.ComicNotification;
   import _81._91;
   
   public class _523 extends _533
   {
      private var _3779:Vector.<_646>;
      
      private var _3781:Vector.<_79>;
      
      public function _523()
      {
         super();
         this._3779 = new Vector.<_646>();
         this._3781 = new Vector.<_79>();
      }
      
      public function get _3782() : _646
      {
         return _3783 as _646;
      }
      
      public function get _3054() : _79
      {
         return _3783 as _79;
      }
      
      public function set _3782(param1:_646) : void
      {
         _3053 = param1;
      }
      
      public function set _3054(param1:_79) : void
      {
         _3053 = param1;
      }
      
      public function get _3584() : Vector.<_646>
      {
         return this._3779;
      }
      
      public function get _3050() : Vector.<_79>
      {
         return this._3781;
      }
      
      override public function _2986(param1:Vector.<_91>, param2:_91 = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1 == null && param2 == null && _3780.length == 0)
         {
            return;
         }
         if(Boolean(param2) && _3780.length == 1)
         {
            if(_3780[0] == param2)
            {
               return;
            }
         }
         _3780.length = 0;
         if(param2)
         {
            _3780.push(param2);
         }
         else if(param1)
         {
            _loc3_ = 0;
            _loc4_ = int(param1.length);
            while(_loc3_ < _loc4_)
            {
               _3780.push(param1[_loc3_]);
               _loc3_++;
            }
         }
         this._3778();
      }
      
      override protected function _3778() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         this._3781.length = 0;
         this._3779.length = 0;
         _loc1_ = 0;
         _loc2_ = int(_3780.length);
         while(_loc1_ < _loc2_)
         {
            if(_3780[_loc1_] is _646)
            {
               this._3779.push(_3780[_loc1_] as _646);
            }
            else if(_3780[_loc1_] is _79)
            {
               this._3781.push(_3780[_loc1_] as _79);
            }
            _loc1_++;
         }
         _1567(new ComicNotification(ComicNotification.UPDATE_SELCTEDS));
      }
      
      override protected function _3777(param1:_91) : void
      {
         if(param1)
         {
            _1567(new ComicNotification(ComicNotification.ROLLOVER_ITEM,param1));
         }
         else
         {
            _1567(new ComicNotification(ComicNotification.ROLLOUT_ITEM));
         }
      }
   }
}

