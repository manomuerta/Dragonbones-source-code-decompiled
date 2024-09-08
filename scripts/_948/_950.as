package _948
{
   import _127._146;
   import _51._79;
   import _825._827;
   import _97._100;
   import _97._103;
   
   public class _950 extends _146
   {
      private var _2710:_827;
      
      public function _950()
      {
         super();
         width = 0;
         height = 0;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2710 = new _827(_100._2257);
         addElement(this._2710);
      }
      
      override public function set data(param1:Object) : void
      {
         var _loc2_:int = _103._2276._2277(param1);
         if(_loc2_ != -1)
         {
            _103._2275(_loc2_);
         }
         else if(_data == param1)
         {
            return;
         }
         _data = param1;
         this._2539();
      }
      
      override protected function _2539() : void
      {
         if(this._2710)
         {
            if(this._2710._1837 != data)
            {
               this._2710._1837 = data as _79;
            }
            else
            {
               this._2710._1988();
            }
         }
      }
   }
}

