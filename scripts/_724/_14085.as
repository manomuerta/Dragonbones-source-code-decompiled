package _724
{
   import _14201._14205;
   import _521._528;
   import _741._746;
   import flash.utils.Timer;
   
   public class _14085 extends _725
   {
      public static const LOADING_HIDE_TIME:int = 1000;
      
      protected var _14697:_14205;
      
      protected var _disposed:Boolean;
      
      protected var _10536:Timer;
      
      public function _14085(param1:_746 = null)
      {
         var _loc2_:Vector.<_746> = null;
         this._10536 = new Timer(LOADING_HIDE_TIME,1);
         if(param1)
         {
            _loc2_ = new Vector.<_746>();
            _loc2_.push(param1);
         }
         super(_loc2_);
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = int(reference.length);
         while(_loc1_ < _loc2_)
         {
            reference[_loc1_]._5747 = true;
            reference[_loc1_]._5724 = _528._14513;
            _loc1_++;
         }
         reference.length = 0;
         if(this._14697)
         {
            this._14697 = null;
         }
      }
      
      public function get _14699() : Object
      {
         return this._14697.clone();
      }
      
      public function get _5899() : Boolean
      {
         return this._disposed;
      }
      
      public function _2095(param1:Function) : void
      {
      }
   }
}

