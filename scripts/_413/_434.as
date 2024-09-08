package _413
{
   import _13492._13496;
   import _214._213;
   import _93._92;
   
   public class _434 extends _92
   {
      public function _434()
      {
         super();
         _2219 = true;
         _2215 = false;
      }
      
      override public function execute() : void
      {
         if(Boolean(this.data) && this.data.length > 0)
         {
            _213._2836(this.data);
            _213.project = _2214._1844;
         }
      }
      
      private function get data() : Vector.<_13496>
      {
         return _2223 as Vector.<_13496>;
      }
   }
}

