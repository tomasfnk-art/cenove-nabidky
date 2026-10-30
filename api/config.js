module.exports = function handler(req,res) {
  res.setHeader('Cache-Control','no-store');
  res.json({url:process.env.SUPABASE_URL||null,key:process.env.SUPABASE_PUBLISHABLE_KEY||null});
};
